# SPDX-FileCopyrightText: © 2026 Gracia Xia, Judy Yu
# SPDX-License-Identifier: Apache-2.0

# Python golden model
import sys
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ClockCycles

sys.path.append(str(Path(__file__).resolve().parent.parent / "python_experiments"))

from rtl_golden_model import *

def get_dut_output(dut):
    # uio_out[3:0] contains t_out[11:8]
    # uo_out contains t_out[7:0]

    upper = int(dut.uio_out.value[3:0])
    lower = int(dut.uo_out.value)

    return (upper << 8) | lower

def encode_5_3(cos_code):
    cos_out_7_5 = cos_code >> 5

    T = (
        ((cos_out_7_5 >= 7) << 6) |
        ((cos_out_7_5 >= 6) << 5) |
        ((cos_out_7_5 >= 5) << 4) |
        ((cos_out_7_5 >= 4) << 3) |
        ((cos_out_7_5 >= 3) << 2) |
        ((cos_out_7_5 >= 2) << 1) |
        (cos_out_7_5 >= 1)
    )

    B = cos_code & 0b11111

    return (T << 5) | B

async def step(dut, model, enable, sample, rst_n=1):
    # Drive inputs before the rising edge
    dut.ui_in.value = (int(enable) << 1) | int(sample)
    dut.rst_n.value = rst_n

    await RisingEdge(dut.clk)

    # Advance the reference model using the same inputs
    model.tick(enable, sample, rst_n)

    # Get expected output
    expected_cos = model.get_output()
    assert 0 <= expected_cos <= 0xFF
    expected = encode_5_3(expected_cos)

    # Drive the Python golden model output into the simulator
    # Using {ui_in[7:2], uio_out[5:4]} to inject golden_cos_out

    # Only ui_in[1:0] should be used by `enable` and `in`
    assert int(dut.ui_in.value) == int(dut.ui_in.value) & 0x3 
    dut.ui_in.value = int(dut.ui_in.value) | (expected_cos & 0xFC)

    # No other inputs are used so set those bits to 0
    dut.uio_in.value = ((expected_cos & 0x3) << 4)

    # Allow combinational logic to settle
    await Timer(1, unit="ns")

    # Get actual output
    actual = get_dut_output(dut)

    assert actual == expected, (
        f"Mismatch!\n"
        f"Input: {sample}\n"
        f"Enable: {enable}\n"
        f"Phase: {model.phase:#06x}\n"
        f"Expected cosine: {expected_cos:#04x}\n"
        f"Expected output: {expected:#05x}\n"
        f"Actual output: {actual:#05x}"
    )

@cocotb.test()
async def msk_golden_model_test(dut):
    params = ModulationParams(
        n=8,
        k=8,
        j=8,
        m=8,

        # For IF/sample_freq = 0.1
        f_s=50_000_000,
        f_if=5_000_000,

        seed=20061128,
    )

    dut._log.info(f"Starting Golden Model Test for: \n"
                  f"    IF (f_if) == {params.f_if/1e6} MHz\n"
                  f"    Sampling freq (f_s) == {params.f_s/1e6} MHz\n"
                  f"    LUT output width == {params.n} bits\n"
                  f"    LUT input (address) width == {params.k} bits\n"
                  f"    Accumulator width == {params.k} + {params.j} bits\n"
                  f"    Samples / symbol == {params.m}\n"
                  f"    f_if/f_s == {params.f_if/params.f_s}\n"
                  f"    Seed for pseudorandom input bit stream: {params.seed}\n"
                  )

    model = MSKGoldenModel(params)

    dut._log.info(f"Setting clock period to 1/f_s == {1/(params.f_s/1e9)} ns")
    # Set the clock period to correspond with f_s
    clock = Clock(dut.clk, 1/(params.f_s/1e9), unit="ns")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1

    dut._log.info("Resetting Golden Model")
    model.reset()

    dut._log.info("Resetting DUT")
    # Wait 10 samples (arbitrary value)
    for _ in range(10):
        await step(dut, model, 0, 0, rst_n=0)

    # Release reset, but keep modulator disabled
    await step(dut, model, 0, 0, rst_n=1)

    dut._log.info("Generating Test Data for DUT and Golden Model")
    # Generate test data
    symbols = generate_symbols(
        params.num_bits,
        params.seed
    )

    dut._log.info("Comparing DUT to Golden Model for each symbol")
    # Transmit each symbol for m clock cycles
    for symbol in symbols:
        # m samples per symbol so need m steps
        for _ in range(params.m):
            await step(
                dut,
                model,
                enable=1,
                sample=int(symbol)
            )

    dut._log.info("Disabling modulator to verify phase resets")
    for _ in range(5):
        await step(dut, model, 0, 0, rst_n=1)

    dut._log.info("Re-enabling modulator with new input")
    params.seed=20261117
    symbols = generate_symbols(
        params.num_bits,
        params.seed
    )
    for symbol in symbols:
        # m samples per symbol so need m steps
        for _ in range(params.m):
            await step(
                dut,
                model,
                enable=1,
                sample=int(symbol)
            )
# SPDX-FileCopyrightText: © 2026 Gracia Xia, Judy Yu
# SPDX-License-Identifier: Apache-2.0

# Python golden model
import sys
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer

sys.path.append(str(Path(__file__).resolve().parent.parent / "python_experiments"))

from rtl_golden_model import *

def get_dut_output(dut):
    # uio_out[3:0] contains t_out[11:8]
    # uo_out contains t_out[7:0]

    upper = int(dut.uio_out.value) & 0x0F
    lower = int(dut.uo_out.value)

    return (upper << 8) | lower

def encode_5_3(cos_code):
    c7 = (cos_code >> 7) & 1
    c6 = (cos_code >> 6) & 1
    c5 = (cos_code >> 5) & 1

    T = (
        ((c7 & c6 & c5) << 6) |
        ((c7 & c6 & (1-c5)) << 5) |
        ((c7 & (1-c6) & c5) << 4) |
        ((c7 & (1-c6) & (1-c5)) << 3) |
        (((1-c7) & c6 & c5) << 2) |
        (((1-c7) & c6 & (1-c5)) << 1) |
        ((1-c7) & (1-c6) & c5)
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
    expected = encode_5_3(expected_cos)
    # Drive the Python golden model output into the simulator
    dut.golden_cos_out.value = expected_cos

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

        # f"Debug:\n"
        # f"Golden phase: {model.phase:#06x}"
        # f"Golden address: {model.phase >> params.j:#04x}"
        # f"Golden LUT output: {model.get_output():#04x}"

        # f"DUT phase: {int(dut.transmit_inst.phase.value):#06x}"
        # f"DUT LUT address: {int(dut.transmit_inst.phase.value) >> 8:#04x}"
        # f"DUT LUT output: {int(dut.transmit_inst.cos_out.value):#04x}"
    )

@cocotb.test()
async def msk_golden_model_test(dut):

    params = ModulationParams(
        n=8,
        k=8,
        j=8,
        m=8,

        # For IF/sample_freq = 0.04
        f_s=50_000_000,
        f_if=2_000_000,

        seed=20061128,
    )

    model = MSKGoldenModel(params)

    clock = Clock(dut.clk, 20, unit="ns")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1

    # Reset
    for _ in range(10):
        await step(dut, model, 0, 0, rst_n=0)

    # Release reset
    await step(dut, model, 0, 0, rst_n=1)

    # Generate test data
    symbols = generate_symbols(
        params.num_bits,
        params.seed
    )

    # Transmit each symbol for m clock cycles
    for symbol in symbols:
        for _ in range(params.m):
            await step(
                dut,
                model,
                enable=1,
                sample=int(symbol)
            )

    # Disable transmitter
    for _ in range(20):
        await step(dut, model, 0, 0)
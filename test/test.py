# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.types import LogicArray as Arr

@cocotb.test(skip=False)
async def phase_accumulator_test(dut):
    dut._log.info("Start")

    # Set the clock period to 100 ps (10 MHz)
    clock = Clock(dut.clk, 100, unit="ps")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Phase Accumulator Test")

    dut.uio_in.value = Arr("00000100") # Enabling transmit
    await ClockCycles(dut.clk, 1)

    dut._log.info("Inputting 10101010")
    input = Arr("10101010")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)

    assert dut.uo_out.value == 0x06, f"Expected 0x06, got {dut.uo_out.value}" # All values are off by one clock cycle due to a delay
    
    dut.uio_in.value = 0 # Checking that value no longer changes after transmission is disabled
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 0x09, f"Expected 0x09, got {dut.uo_out.value}"
    await ClockCycles(dut.clk, 10)
    assert dut.uo_out.value == 0x09, f"Expected 0x09, got {dut.uo_out.value}"
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.uio_in.value = Arr("00000100")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 00001111")
    input = Arr("00001111")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0x00, f"Expected 0x00, got {dut.uo_out.value}"
        
    dut._log.info("Inputting 11110000")
    input = Arr("11110000")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0xE2, f"Expected 0xE2, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0x7C, f"Expected 0x7C, got {dut.uo_out.value}"
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.uio_in.value = Arr("00000100")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0xD3, f"Expected 0xD3, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 110")
    input = Arr("110")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0x14, f"Expected 0x14, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 00")
    input = Arr("00")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0x06, f"Expected 0x06, got {dut.uo_out.value}"
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.uio_in.value = Arr("00000100")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 00000000")
    input = Arr("00000000")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0x06, f"Expected 0x06, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 11111111")
    input = Arr("11111111")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0xFA, f"Expected 0xFA, got {dut.uo_out.value}"
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.uio_in.value = Arr("00000100")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0x00, f"Expected 0x00, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0xF4, f"Expected 0xF4, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 0")
    input = Arr("0")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0xA7, f"Expected 0xA7, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    assert dut.uo_out.value == 0x5D, f"Expected 0x5D, got {dut.uo_out.value}"
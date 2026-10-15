# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.types import LogicArray as Arr

@cocotb.test(skip=False)
async def test_transmit(dut):
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

    dut._log.info("Transmit Mode Test")

    dut.uio_in.value = Arr("00000100") # Set to transmit mode
    await ClockCycles(dut.clk, 1)

    dut._log.info("Inputting 10101010")
    input = Arr("10101010")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
        
    await ClockCycles(dut.clk, 1)        
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
        
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 0x09, f"Expected 0x09, got {dut.uo_out.value}"
        
    dut._log.info("Inputting 11110000")
    input = Arr("11110000")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
        
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 0xDE, f"Expected 0xDE, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
        
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 0x43, f"Expected 0x43, got {dut.uo_out.value}"
    
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
    
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 0xA2, f"Expected 0xA2, got {dut.uo_out.value}"
    
    dut._log.info("Inputting 110")
    input = Arr("110")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
        
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 0x11, f"Expected 0x11, got {dut.uo_out.value}"
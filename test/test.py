# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.types import LogicArray as Arr

def bto6_2(val):
    out = (val >> 2) << 3
    val = val & 0b11
    if (val == 0b11):
        out += 0b100
    elif (val == 0b10):
        out += 0b10
    elif (val == 0b01):
        out += 0b01
    return out

def check(dut, val):
    output = Arr((int(dut.uio_out.value) << 8) + int(dut.uo_out.value), 9)
    assert output == bto6_2(val), f"Expected {bto6_2(val)}, got {output}"

@cocotb.test(skip=False)
async def phase_accumulator_test(dut):
    dut._log.info("Start")

    # Set the clock period to 20 ns (50 MHz)
    clock = Clock(dut.clk, 20, unit="ns")
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
    
    check(dut, 0x06) # All values are off by one clock cycle due to a delay
    
    dut._log.info("Disable transmit")
    dut.uio_in.value = 0 # Checking that value no longer changes after transmission is disabled
    await ClockCycles(dut.clk, 1)
    check(dut, 0x09)
    await ClockCycles(dut.clk, 10)
    check(dut, 0x09)
    
    dut._log.info("Enable transmit")
    dut.uio_in.value = Arr("00000100")
    await ClockCycles(dut.clk, 1)
    dut._log.info(dut.uo_out.value)
    
    dut._log.info("Inputting 11")
    input = Arr("11")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
        
    # assert dut.uo_out.value == 0x25, f"Expected 0x25, got {dut.uo_out.value}"
    check(dut, 0x25)
    
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
    
    check(dut, 0x00)
        
    dut._log.info("Inputting 11110000")
    input = Arr("11110000")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0xE2)
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0x7C)
    
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
    
    check(dut, 0xD3)
    
    dut._log.info("Inputting 110")
    input = Arr("110")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0x14)
    
    dut._log.info("Inputting 00")
    input = Arr("00")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0x06)
    
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
    
    check(dut, 0x06)
    
    dut._log.info("Inputting 11111111")
    input = Arr("11111111")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0xFA)
    
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
    
    check(dut, 0x00)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0xF4)
    
    dut._log.info("Inputting 0")
    input = Arr("0")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0xA7)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    for i in input:
        # Only change uio_in[0]
        dut.uio_in.value = Arr(((int(dut.uio_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)
    
    check(dut, 0x5D)
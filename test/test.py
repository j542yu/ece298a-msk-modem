# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.types import LogicArray as Arr
import math

def cos_lut(val, delay = True):
    j = 8
    k = 8
    n = 8
    m = 8
    IF_FS = 0.04 # IF-Fs ratio
    if_inc = round((1 << (k + j)) * IF_FS)
    inc = (1 << (k+j)) / (2*2*n)
    prop_const = 2 * math.pi / (1 << k)
    max_code = (1 << n) - 1
    
    ones = 8*str(val).count('1')
    zeroes = 8*str(val).count('0')
    last = val[0]
    
    sum = ones*(if_inc+inc) + zeroes*(if_inc-inc)

    if delay:
        if last == 0:
            sum -= (if_inc - inc)
        else:
            sum -= (if_inc + inc)
    
    sum %= 1 << (k+j)    
    sum = int(sum) >> j
    
    out = round((math.cos(sum * prop_const) + 1) * max_code / 2)
    
    return out % (1 << n)

def bto6_2(val):
    out = val & 0b111111
    val = val >> 6
    if (val == 0b11):
        out += 0b100 << 6
    elif (val == 0b10):
        out += 0b10 << 6
    elif (val == 0b01):
        out += 0b1 << 6
    return out

def bto5_3(val):
    out = val & 0b11111
    val = val >> 5
    if (val == 0b111):
        out += 0b1000000 << 5
    elif (val == 0b110):
        out += 0b100000 << 5
    elif (val == 0b101):
        out += 0b10000 << 5
    elif (val == 0b100):
        out += 0b1000 << 5
    elif (val == 0b011):
        out += 0b100 << 5
    elif (val == 0b010):
        out += 0b10 << 5
    elif (val == 0b001):
        out += 0b1 << 5
    return out

def check_6_2(dut, val): 
    output = Arr((int(dut.uio_out.value[0]) << 8) + int(dut.uo_out.value), 9)
    assert output == bto6_2(val), f"Expected {bto6_2(val)}, got {output}"
    
def check_5_3(dut, val): 
    output = Arr((int(dut.uio_out.value[3:0]) << 8) + int(dut.uo_out.value), 12)
    assert output == bto5_3(val), f"Expected {bto5_3(val)}, got {output}"

async def stream(dut, input):
    for i in input:
        # Only change ui_in[0]
        dut.ui_in.value = Arr(((int(dut.ui_in.value) >> 1) << 1) + int(i), 8)
        # dut._log.info(dut.uo_out.value)
        await ClockCycles(dut.clk, 8)

@cocotb.test(skip=False)
async def mod_6_2_test(dut):
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
    
    accumulated = 0

    dut.ui_in.value = Arr("00000010") # Enabling transmit
    await ClockCycles(dut.clk, 1)

    dut._log.info("Inputting 10101010")
    input = Arr("10101010")
    await stream(dut, input)
    
    # check(dut, 0x06) # All values are off by one clock cycle due to a delay
    check_6_2(dut, cos_lut(input))
    
    dut._log.info("Disable transmit")
    dut.ui_in.value = 0 # Checking that value no longer changes after transmission is disabled
    await ClockCycles(dut.clk, 1)
    check_6_2(dut, cos_lut(input, False))
    await ClockCycles(dut.clk, 10)
    check_6_2(dut, cos_lut(input, False))
    
    dut._log.info("Enable transmit")
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    check_6_2(dut, cos_lut(input, False))
    
    dut._log.info("Inputting 11")
    input = Arr("11")
    await stream(dut, input)
    
    # assert dut.uo_out.value == 0x25, f"Expected 0x25, got {dut.uo_out.value}"
    check_6_2(dut, 0x25)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 00001111")
    input = Arr("00001111")
    await stream(dut, input)
    
    check_6_2(dut, 0x0)
        
    dut._log.info("Inputting 11110000")
    input = Arr("11110000")
    await stream(dut, input)
    
    check_6_2(dut, 0xE2)
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    await stream(dut, input)
    
    check_6_2(dut, 0x7C)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    await stream(dut, input)
    
    check_6_2(dut, 0xD3)
    
    dut._log.info("Inputting 110")
    input = Arr("110")
    await stream(dut, input)
    
    check_6_2(dut, 0x14)
    
    dut._log.info("Inputting 00")
    input = Arr("00")
    await stream(dut, input)
    
    check_6_2(dut, 0x06)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 00000000")
    input = Arr("00000000")
    await stream(dut, input)
    
    check_6_2(dut, 0x06)
    
    dut._log.info("Inputting 11111111")
    input = Arr("11111111")
    await stream(dut, input)
    
    check_6_2(dut, 0xFA)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    await stream(dut, input)
    
    check_6_2(dut, 0x0)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    await stream(dut, input)
    
    check_6_2(dut, 0xF4)
    
    dut._log.info("Inputting 0")
    input = Arr("0")
    await stream(dut, input)
    
    check_6_2(dut, 0xA7)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    await stream(dut, input)
    
    check_6_2(dut, 0x5D)

@cocotb.test(skip=True)    
async def mod_5_3_test(dut):
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

    dut.ui_in.value = Arr("00000010") # Enabling transmit
    await ClockCycles(dut.clk, 1)

    dut._log.info("Inputting 10101010")
    input = Arr("10101010")
    await stream(dut, input)
    
    # check(dut, 0x06) # All values are off by one clock cycle due to a delay
    check_5_3(dut, cos_lut(input))
    
    dut._log.info("Disable transmit")
    dut.uio_in.value = 0 # Checking that value no longer changes after transmission is disabled
    await ClockCycles(dut.clk, 1)
    check_5_3(dut, cos_lut(input, False))
    await ClockCycles(dut.clk, 10)
    check_5_3(dut, cos_lut(input, False))
    
    dut._log.info("Enable transmit")
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    check_5_3(dut, cos_lut(input, False))
    
    dut._log.info("Inputting 11")
    input = Arr("11")
    await stream(dut, input)
    
    # assert dut.uo_out.value == 0x25, f"Expected 0x25, got {dut.uo_out.value}"
    check_5_3(dut, 0x25)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 00001111")
    input = Arr("00001111")
    await stream(dut, input)
    
    check_5_3(dut, 0x0)
        
    dut._log.info("Inputting 11110000")
    input = Arr("11110000")
    await stream(dut, input)
    
    check_5_3(dut, 0xE2)
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    await stream(dut, input)
    
    check_5_3(dut, 0x7C)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 101")
    input = Arr("101")
    await stream(dut, input)
    
    check_5_3(dut, 0xD3)
    
    dut._log.info("Inputting 110")
    input = Arr("110")
    await stream(dut, input)
    
    check_5_3(dut, 0x14)
    
    dut._log.info("Inputting 00")
    input = Arr("00")
    await stream(dut, input)
    
    check_5_3(dut, 0x06)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 00000000")
    input = Arr("00000000")
    await stream(dut, input)
    
    check_5_3(dut, 0x06)
    
    dut._log.info("Inputting 11111111")
    input = Arr("11111111")
    await stream(dut, input)
    
    check_5_3(dut, 0xFA)
    
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ui_in.value = Arr("00000010")
    await ClockCycles(dut.clk, 1)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    await stream(dut, input)
    
    check_5_3(dut, 0x0)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    await stream(dut, input)
    
    check_5_3(dut, 0xF4)
    
    dut._log.info("Inputting 0")
    input = Arr("0")
    await stream(dut, input)
    
    check_5_3(dut, 0xA7)
    
    dut._log.info("Inputting 1")
    input = Arr("1")
    await stream(dut, input)
    
    check_5_3(dut, 0x5D)
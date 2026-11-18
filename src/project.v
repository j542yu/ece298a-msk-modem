/*
 * Copyright (c) 2024 Gracia Xia, Judy Yu
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_modulator (
    // input  wire       VGND,
    // input  wire       VDPWR,
    // Do I need to add these power rails??

    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n//,  // reset_n - low to reset

    // Debug
    // Using {ui_in[7:2], uio_in[5:4]} to inject golden_cos_out instead
    // input wire [7:0] golden_cos_out, 
     
    // Debug unused in golden_model_test.py
    // output wire [15:0] phase_debug,
    // output wire [7:0] cos_out_debug
);

  // Using uio_out[3:0] for part of RTL output
  // Using uio_in[5:4] for part of golden model output for testing
  // (full 8 bits is {ui_in[7:2], uio_in[5:4]})
  assign uio_oe = 8'b11001111;
  
  // 5_3
  assign uio_out[7:6] = 0;

  wire [11:0] t_out;
  assign uio_out[3:0] = t_out[11:8];
  assign uo_out = t_out[7:0];

  tt_um_transmit_5_3 transmit_inst(
    .clk(clk),
    .rst_n(rst_n),
    .enable(ui_in[1]),
    .in(ui_in[0]),

    .B(t_out[4:0]),
    .T(t_out[11:5])//,

    // .phase_debug(phase_debug),
    // .cos_out_debug(cos_out_debug)
  );
    
  // List all unused inputs to prevent warnings
  // Using {ui_in[7:2], uio_in[5:4]} to inject golden_cos_out instead
  wire _unused = &{ena, uio_in[7:6], uio_in[3:0], 1'b0};
                   

endmodule

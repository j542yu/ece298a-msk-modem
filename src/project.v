/*
 * Copyright (c) 2024 Judy Yu
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_msk_modem (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;

  average_samples average_samples_inst(
    .clk(clk),
    .rst_n(rst_n),
    .sample(ui_in[5:0]),
    .average(uo_out[5:0]),
    .output_ready(uo_out[6]),
    .input_hold(uo_out[7])
  );

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, ui_in[7:6], 1'b0};

endmodule

`default_nettype none

module transmit (
  input wire in,
  output reg [7:0] out,
  input wire clk,
  input wire rst_n,
  input wire enable
);

parameter I_F_OFFSET = 16'h0A3D; // 0.04 * 256,  IF/sample_freq = 0.04

// Registers and Wires

reg [15:0] phase;
reg delay;

cos_lut lut (.angle_in(phase[15:8]), .cos(out));

// 8 samples per symbol
// Phase accumulator
always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    phase <= 16'b0;
    delay <= 0;
  end else if (enable) begin
    delay <= 1; // Introduce a delay at the beginning to ensure that the input has enough time to update
    // Sampling frequency will be chosen to allow for 8 samples per symbol?
    if (in && delay) begin
      phase <= phase + I_F_OFFSET + 16'h0800;
    end else if (!in && delay) begin
      phase <= phase + I_F_OFFSET - 16'h0800;
    end
  end
end

endmodule
`default_nettype none

module transmit (
  input wire in,
  output reg [7:0] out, // Correct output occurs one clock cycle after the input signal completes
  input wire clk,
  input wire rst_n,
  input wire enable
);

parameter I_F_OFFSET = 16'h0A3D; // 0.04 * 256,  IF/sample_freq = 0.04, 8 samples per symbol

// Registers and Wires

reg [15:0] phase;
reg delay; // Shifted enable to ensure that input has enough time to update and avoid errors at the beginning of transmission

cos_lut lut (.angle_in(phase[15:8]), .cos(out));

always @(posedge clk or negedge rst_n) begin
  if (!rst_n) delay <= 0;
  else delay <= enable;
end

// Phase accumulator
always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    phase <= 16'b0;
  end else if (enable) begin
    // Sampling frequency will be chosen to allow for 8 samples per symbol?
    if (in && delay) begin
      phase <= phase + I_F_OFFSET + 16'h0800;
    end else if (!in && delay) begin
      phase <= phase + I_F_OFFSET - 16'h0800;
    end
  end
end

endmodule
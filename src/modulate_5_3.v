`default_nettype none

module transmit_5_3 (
  input wire in,
  output wire [11:0] out, // Correct output occurs one clock cycle after the input signal completes
  input wire clk,
  input wire rst_n,
  input wire enable
);

parameter I_F_OFFSET = 16'h0A3D; // 0.04 * 256,  IF/sample_freq = 0.04, 8 samples per symbol

// Registers and Wires

reg [15:0] phase;
reg delay_en; // Shifted enable to ensure that input has enough time to update and avoid errors at the beginning of transmission
reg [7:0] cos_out;

cos_lut lut (.angle_in(phase[15:8]), .cos(cos_out));

assign out = { 
  {cos_out[7] & cos_out[6] & cos_out[5]}, 
  {cos_out[7] & cos_out[6] & !cos_out[5]}, 
  {cos_out[7] & !cos_out[6] & cos_out[5]}, 
  {cos_out[7] & !cos_out[6] & !cos_out[5]}, 
  {!cos_out[7] & cos_out[6] & cos_out[5]}, 
  {!cos_out[7] & cos_out[6] & !cos_out[5]},
  {!cos_out[7] & !cos_out[6] & cos_out[5]}, 
  {cos_out[4:0]}};

always @(posedge clk or negedge rst_n) begin
  if (!rst_n) delay_en <= 0;
  else delay_en <= enable;
end

// Phase accumulator
always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    phase <= 16'b0;
  end else if (delay_en && enable) begin
    // Sampling frequency will be chosen to allow for 8 samples per symbol?
    if (in) begin
      phase <= phase + I_F_OFFSET + 16'h0800;
    end else begin
      phase <= phase + I_F_OFFSET - 16'h0800;
    end
  end
end

endmodule

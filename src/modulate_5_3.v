`default_nettype none

module tt_um_transmit_5_3 (
  input wire clk,
  input wire rst_n,
  input wire enable,  
  input wire in,

  output wire [4:0] B,
  output wire [6:0] T //, // Correct output occurs one clock cycle after the input signal completes

  // Debug
  // output wire [15:0] phase_debug,
  // output wire [7:0] cos_out_debug
);

/*
  For how this is mapped to an integer code, see:
  python_experiments/ModulationParams.py
  
  Essentially this code was run in python_experiments/main.py:
    params = ModulationParams(
      n=8, // output width
      k=8, // LUT input (address) width
      j=8, // k + j is accumulator width
      m=8, // # samples / symbol

      # For f_if/f_s = 0.1
      f_s=50_000_000,
      f_if=5_000_000,
  )

    if_increment_rad = (
        2 * math.pi * params.f_if / params.f_s
    )

    print(f"For f_if/f_s == 0.1, IF_OFFSET == {hex(rad_to_address(if_increment_rad, params))}")
*/
parameter IF_OFFSET = 16'h199A; 

// Registers and Wires

reg [15:0] phase;
reg delay_en; // Shifted enable to ensure that input has enough time to update and avoid errors at the beginning of transmission
reg [7:0] cos_out;

cos_lut lut (.angle_in(phase[15:8]), .cos(cos_out));

assign T = { 
  {cos_out[7] & cos_out[6] & cos_out[5]}, 
  {cos_out[7] & cos_out[6] & !cos_out[5]}, 
  {cos_out[7] & !cos_out[6] & cos_out[5]}, 
  {cos_out[7] & !cos_out[6] & !cos_out[5]}, 
  {!cos_out[7] & cos_out[6] & cos_out[5]}, 
  {!cos_out[7] & cos_out[6] & !cos_out[5]},
  {!cos_out[7] & !cos_out[6] & cos_out[5]}};

assign B = {cos_out[4:0]};

// Debug
// assign phase_debug = phase;
// assign cos_out_debug = cos_out;

always @(posedge clk or negedge rst_n) begin
  if (!rst_n) delay_en <= 0;
  else delay_en <= enable;
end

// Phase accumulator
always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    phase <= 16'b0;
  end else if (delay_en && enable) begin
    // Sampling frequency will be chosen to allow for 8 samples per symbol
    if (in) begin
      phase <= phase + IF_OFFSET + 16'h0800;
    end else begin
      phase <= phase + IF_OFFSET - 16'h0800;
    end
  end
end

endmodule

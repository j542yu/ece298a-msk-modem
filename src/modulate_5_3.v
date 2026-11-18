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
reg [7:0] cos_out;

cos_lut lut (.angle_in(phase[15:8]), .cos(cos_out));

assign T = {
    (cos_out[7:5] >= 3'd7),
    (cos_out[7:5] >= 3'd6),
    (cos_out[7:5] >= 3'd5),
    (cos_out[7:5] >= 3'd4),
    (cos_out[7:5] >= 3'd3),
    (cos_out[7:5] >= 3'd2),
    (cos_out[7:5] >= 3'd1)
};

assign B = {cos_out[4:0]};

// Debug
// assign phase_debug = phase;
// assign cos_out_debug = cos_out;

// Two stage FF synchronizer to protect against metastability
reg in_meta, in_sync;
reg enable_meta, enable_sync;

always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    in_meta <= 1'b0;
    in_sync <= 1'b0;

    enable_meta <= 1'b0;
    enable_sync <= 1'b0;
  end else begin
    in_meta <= in;
    in_sync <= in_meta;

    enable_meta <= enable;
    enable_sync <= enable_meta;
  end
end

// Phase accumulator
always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    phase <= 16'b0;
  end else if (enable_sync) begin
    // 0x800 is the integer code of pi / (2*m) where m = 8 samples / symbol
    if (in_sync) begin
      phase <= phase + IF_OFFSET + 16'h0800;
    end else begin
      phase <= phase + IF_OFFSET - 16'h0800;
    end
  end
end

endmodule

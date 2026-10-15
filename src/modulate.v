`default_nettype none

module transmit (
  input wire in,
  output reg [7:0] out,
  input wire clk,
  input wire rst_n,
  input wire enable
);

// Registers and Wires
// reg [2:0] sample;

wire [11:0] wangle;
wire [7:0] IQ;
reg [11:0] angle;

assign wangle = angle;

cos_lut lut (.angle(wangle), .cos(IQ));

assign out = IQ;

// 8 samples per symbol
// Phase accumulator
always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    // sample <= 3'b111;
    angle <= 12'b0;
  end else if (enable) begin
    angle <= {12{in}};
  end
end

endmodule
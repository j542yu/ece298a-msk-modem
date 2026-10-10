`default_nettype none

module transmit (
  input wire in,
  output wire [11:0] out, // 6 bit I out[5:0], 6 bit Q out[11:6]
  input wire clk,
  input wire rst_n
);

// Registers
reg curr;
reg [2:0] sample;

reg [5:0] I;
reg [5:0] Q;
assign out = {Q, I};

reg clk2;

reg [4:0] cosangle;
wire [4:0] wangle;
wire [5:0] IQ;
reg [4:0] angle;

assign wangle = angle;

cos_lut inst (.angle(wangle), .cos(IQ));

// 8 samples per symbol
// Phase accumulator
always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    sample <= 3'b111;
    clk2 <= 0;
    Q <= 0;
  end
  else begin

    if (sample == 3'b111) curr <= in;
    
    sample <= sample + 1;
    
    cosangle <= cosangle + {curr, 1'b0} - 1; // phase + 2*curr -1

    // Phase to amplitude conversion
    clk2 <= ~clk2;
    
    if (clk2) begin 
      angle <= cosangle + 4'h8; // sine
    end
    else begin 
      angle <= cosangle; // cosine
    end
    
    Q <= IQ;
  end
end

always @(negedge clk2 or negedge rst_n) begin // Will need to test to see if it's posedge or negedge here
  if (!rst_n) begin
    I <= 0;
  end
  else I <= IQ;
end

endmodule

// Cosine/sine lookup table
module cos_lut (
  input reg [4:0] angle,
  output reg [5:0] cos
);
// Since it's 8 samples per symbol, only need to keep cosines of 32 angles (multiples of pi/16)
// The angle value is a number from 0 to 31
always@(*) begin
  case(angle)
    // Using fixed point s b.bbbb
    5'b00000: cos = 6'b010000; // 1
    5'b00001: cos = 6'b001111; // 0.9807852804 (8 bit 8'b00111111 ~ 0.984375) (6 bit ~ 0.9375)
    5'b00010: cos = 6'b001110; // 0.9238795325 (8 bit 8'b00111011 ~ 0.921875) (6 bit ~ 0.8750)
    5'b00011: cos = 6'b001101; // 0.8314696123 (8 bit 8'b00110101 ~ 0.828125) (6 bit ~ 0.8125)
    5'b00100: cos = 6'b001011; // 0.7071067812 (8 bit 8'b00101101 ~ 0.703125) (6 bit ~ 0.6875)
    5'b00101: cos = 6'b001001; // 0.5555702330 (8 bit 8'b00100100 ~ 0.562500) (6 bit ~ 0.5625)
    5'b00110: cos = 6'b000110; // 0.3826834324 (8 bit 8'b00011000 ~ 0.375000) (6 bit ~ 0.3750)
    5'b00111: cos = 6'b000011; // 0.1950903220 (8 bit 8'b00001100 ~ 0.187500) (6 bit ~ 0.1875)
    5'b01000: cos = 6'b000000;
    5'b01001: cos = 6'b111101; // -0.1950903220
    5'b01010: cos = 6'b111010; // -0.3826834324
    5'b01011: cos = 6'b110111; // -0.5555702330
    5'b01100: cos = 6'b110101; // -0.7071067812
    5'b01101: cos = 6'b110011; // -0.8314696123
    5'b01110: cos = 6'b110010; // -0.9238795325
    5'b01111: cos = 6'b110001; // -0.9807852804
    5'b10000: cos = 6'b110000; // -1
    5'b10001: cos = 6'b110001; // -0.9807852804
    5'b10010: cos = 6'b110010; // -0.9238795325
    5'b10011: cos = 6'b110011; // -0.8314696123
    5'b10100: cos = 6'b110101; // -0.7071067812
    5'b10101: cos = 6'b110111; // -0.5555702330
    5'b10110: cos = 6'b111010; // -0.3826834324
    5'b10111: cos = 6'b111101; // -0.1950903220
    5'b11000: cos = 6'b000000;
    5'b11001: cos = 6'b000011; // 0.1950903220
    5'b11010: cos = 6'b000110; // 0.3826834324
    5'b11011: cos = 6'b001001; // 0.5555702330
    5'b11100: cos = 6'b001011; // 0.7071067812
    5'b11101: cos = 6'b001101; // 0.8314696123
    5'b11110: cos = 6'b001110; // 0.9238795325
    5'b11111: cos = 6'b001111; // 0.9807852804
    default: cos = 6'b011111; // Number greater than 1 for debug purposes, 1.9375
  endcase
end

endmodule

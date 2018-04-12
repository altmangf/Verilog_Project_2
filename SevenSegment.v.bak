/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module SevenSegment(hexBinaryIn, HEX0, HEX1);
	input  [7:0]hexBinaryIn;
	output reg[6:0]HEX0;
	output reg[6:0]HEX1;
	
	wire [3:0]hexInLow;
	wire [3:0]hexInHigh;
	
	assign hexInLow = hexBinaryIn[3:0];
	assign hexInHigh = hexBinaryIn[7:4];
	
	always @(hexInLow, hexInHigh)
		begin
		case (hexInLow)
			4'b0000: HEX0 = 7'b1000000;
			4'b0001: HEX0 = 7'b1111001;
			4'b0010: HEX0 = 7'b0100100;
			4'b0011: HEX0 = 7'b0110000;
			4'b0100: HEX0 = 7'b0011001;
			4'b0101: HEX0 = 7'b0010010;
			4'b0110: HEX0 = 7'b0000010;
			4'b0111: HEX0 = 7'b1111000;
			4'b1000: HEX0 = 7'b0000000;
			4'b1001: HEX0 = 7'b0010000;
			4'b1010: HEX0 = 7'b0001000;
			4'b1011: HEX0 = 7'b0000011;
			4'b1100: HEX0 = 7'b1000110;
			4'b1101: HEX0 = 7'b0100001;
			4'b1110: HEX0 = 7'b0000110;
			4'b1111: HEX0 = 7'b0001110;
		endcase
		case (hexInHigh)
			4'b0000: HEX1 = 7'b1000000;
			4'b0001: HEX1 = 7'b1111001;
			4'b0010: HEX1 = 7'b0100100;
			4'b0011: HEX1 = 7'b0110000;
			4'b0100: HEX1 = 7'b0011001;
			4'b0101: HEX1 = 7'b0010010;
			4'b0110: HEX1 = 7'b0000010;
			4'b0111: HEX1 = 7'b1111000;
			4'b1000: HEX1 = 7'b0000000;
			4'b1001: HEX1 = 7'b0010000;
			4'b1010: HEX1 = 7'b0001000;
			4'b1011: HEX1 = 7'b0000011;
			4'b1100: HEX1 = 7'b1000110;
			4'b1101: HEX1 = 7'b0100001;
			4'b1110: HEX1 = 7'b0000110;
			4'b1111: HEX1 = 7'b0001110;
		endcase
		end
endmodule

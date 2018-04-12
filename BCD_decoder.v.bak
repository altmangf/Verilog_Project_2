/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module SevenSegment(BCDIn0, BCDIn1, BCDIn2, BCDIn3, HEX0, HEX1, HEX2, HEX3);
	input  [3:0]BCDIn0;
	input  [3:0]BCDIn1;
	input  [3:0]BCDIn2;
	input  [3:0]BCDIn3;
	
	output reg[6:0]HEX0;
	output reg[6:0]HEX1;
	output reg[6:0]HEX2;
	output reg[6:0]HEX3;
	
	always @(BCDIn0, BCDIn1, BCDIn2, BCDIn3)
		begin
		case (BCDIn0)
			4'b0000: HEX0 = 7'b1000000;	//0
			4'b0001: HEX0 = 7'b1111001;	//1
			4'b0010: HEX0 = 7'b0100100;	//2
			4'b0011: HEX0 = 7'b0110000;	//3
			4'b0100: HEX0 = 7'b0011001;	//4
			4'b0101: HEX0 = 7'b0010010;	//5
			4'b0110: HEX0 = 7'b0000010;	//6
			4'b0111: HEX0 = 7'b1111000;	//7
			4'b1000: HEX0 = 7'b0000000;	//8
			4'b1001: HEX0 = 7'b0010000;	//9
		endcase
		case (BCDIn1)
			4'b0000: HEX1 = 7'b1000000;	//0
			4'b0001: HEX1 = 7'b1111001;	//1
			4'b0010: HEX1 = 7'b0100100;	//2
			4'b0011: HEX1 = 7'b0110000;	//3
			4'b0100: HEX1 = 7'b0011001;	//4
			4'b0101: HEX1 = 7'b0010010;	//5
			4'b0110: HEX1 = 7'b0000010;	//6
			4'b0111: HEX1 = 7'b1111000;	//7
			4'b1000: HEX1 = 7'b0000000;	//8
			4'b1001: HEX1 = 7'b0010000;	//9
		endcase
		case (BCDIn2)
			4'b0000: HEX2 = 7'b1000000;	//0
			4'b0001: HEX2 = 7'b1111001;	//1
			4'b0010: HEX2 = 7'b0100100;	//2
			4'b0011: HEX2 = 7'b0110000;	//3
			4'b0100: HEX2 = 7'b0011001;	//4
			4'b0101: HEX2 = 7'b0010010;	//5
			4'b0110: HEX2 = 7'b0000010;	//6
			4'b0111: HEX2 = 7'b1111000;	//7
			4'b1000: HEX2 = 7'b0000000;	//8
			4'b1001: HEX2 = 7'b0010000;	//9
		endcase
		case (BCDIn3)
			4'b0000: HEX3 = 7'b1000000;	//0
			4'b0001: HEX3 = 7'b1111001;	//1
			4'b0010: HEX3 = 7'b0100100;	//2
			4'b0011: HEX3 = 7'b0110000;	//3
			4'b0100: HEX3 = 7'b0011001;	//4
			4'b0101: HEX3 = 7'b0010010;	//5
			4'b0110: HEX3 = 7'b0000010;	//6
			4'b0111: HEX3 = 7'b1111000;	//7
			4'b1000: HEX3 = 7'b0000000;	//8
			4'b1001: HEX3 = 7'b0010000;	//9
		endcase
		end
endmodule

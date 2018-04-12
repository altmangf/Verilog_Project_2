//Gabriel Altman
//ECEN2350 Digital Logic
//April, 2018

module Project_2_TOP
(
	MAX10_CLK1_50,
	MAX10_CLK2_50,
	LEDR,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	KEY,
	SW
);


input			MAX10_CLK1_50;
input			MAX10_CLK2_50;
input	[1:0]	KEY;
input	[9:0]	SW;

output	[9:0]	LEDR;
output	[7:0]	HEX0;
output	[7:0]	HEX1;
output	[7:0]	HEX2;
output	[7:0]	HEX3;
output	[7:0]	HEX4;
output	[7:0]	HEX5;

wire [1:0]ENABLE;
wire [1:0]RESET;
wire [3:0]BCD0;
wire [3:0]BCD1;
wire [3:0]BCD2;
wire [3:0]BCD3;
wire [9:0]divided_Clock;
wire [9:0]Slow_Clock;
wire [7:0]LFSR_Value;
wire [1:0]downCount_Complete;
wire [7:0]count;

//assign BCDIn0 = 4'b0000;
//assign BCDIn1 = 4'b0001;
//assign BCDIn2 = 4'b0010;
//assign BCDIn3 = 4'b0011;

//assign ENABLE[0] = 1'b1;
//assign RESET[0] = 1'b0;

assign ENABLE[0] = SW[0];
//assign RESET[0] = SW[1];
assign RESET[0] = !KEY[0];

//Instantiate an instance of SevenSegment.v
//SevenSegment SevenSegInst1(4'b0000, 4'b0001, 4'b0010, 4'b0011, HEX0[6:0], HEX1[6:0], HEX2[6:0], HEX3[6:0]);
BCD_decoder decoder_INST1(BCD0[3:0], BCD1[3:0], BCD2[3:0], BCD3[3:0], HEX0[6:0], HEX1[6:0], HEX2[6:0], HEX3[6:0]);

//Instantiate an instance of BCD_counter.v
BCD_counter BCD_Count_INST1(divided_Clock, RESET, ENABLE, BCD3, BCD2, BCD1, BCD0);
//BCD_counter BCD_Count_INST1(MAX10_CLK1_50, RESET, ENABLE, BCD3, BCD2, BCD1, BCD0);

//Instantiate an instance of Clock_divider
clock_Divider clk_Div_INST1(MAX10_CLK1_50, divided_Clock);

//Instantiate an instance of Slow_Clock
Slow_Clock Slow_Clock_INST1(MAX10_CLK1_50, Slow_Clock);

//Instantiate an instance  of LFSR
LFSR LFSR_INST1(Slow_Clock, LFSR_Value);

//instantiate an instance of down_Counter
//down_Counter down_Counter_INST1(Slow_Clock, LFSR_Value, RESET, ENABLE, count, downCount_Complete);
down_Counter down_Counter_INST1(Slow_Clock, 8'b00000011, RESET, ENABLE, count, downCount_Complete);

assign HEX0[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX1[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX2[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX3[7] = 1'b0;						//Turns ON the decimal point for the 7-segment display
assign HEX4[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX5[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
//assign HEX0 = 8'b11111111;
//assign HEX1 = 8'b11111111;
//assign HEX2[6:0] = 7'b1111111;
//assign HEX3 = 8'b11111111;
assign HEX4 = 8'b11111111;					//Blanks digit 4 of the 7-segment display
assign HEX5 = 8'b11111111;					//Blanks digit 5 of the 7-segment display

//assign LEDR[9:8] = 2'b00;
assign LEDR[9] = !KEY[0];
//assign LEDR[8] = !KEY[1];
//assign LEDR[7:0] = LFSR_Value[7:0];
assign LEDR[8] = downCount_Complete;
assign LEDR[7:0] = count[7:0];
endmodule

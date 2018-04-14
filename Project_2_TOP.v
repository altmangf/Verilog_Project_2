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


input			MAX10_CLK1_50;					//50Mhz system clock 1
input			MAX10_CLK2_50;					//50Mhz system clock 2
input	[1:0]	KEY;								//Push-Buttons
input	[9:0]	SW;								//Switches

output	[9:0]	LEDR;							//LED's (Surface mounted) 
output	[7:0]	HEX0;							//Seven segment display 0
output	[7:0]	HEX1;							//Seven segment display 0
output	[7:0]	HEX2;							//Seven segment display 0
output	[7:0]	HEX3;							//Seven segment display 0
output	[7:0]	HEX4;							//Seven segment display 0
output	[7:0]	HEX5;							//Seven segment display 0

reg [1:0]CLEAR;								//Boolean to clear the BCD Counter
wire [1:0]RESET;								//Reset boolean
wire [3:0]BCD0;								//BCD 0
wire [3:0]BCD1;								//BCD 1
wire [3:0]BCD2;								//BCD 2
wire [3:0]BCD3;								//BCD 3
wire [9:0]divided_Clock;					//the 2kHz clock signal
wire [9:0]Slow_Clock;						//The 1Hz clock signal
wire [7:0]LFSR_Value;						//The random number generated by the LSFR
wire [1:0]downCount_Complete;				//boolean indicating the down_Counter has completed its count
wire [7:0]count;								//the value returned by the down_Counter showing the current value
wire [3:0]display3;							//Carries the BCD values from the MUX to the decoder
wire [3:0]display2;							//Carries the BCD values from the MUX to the decoder
wire [3:0]display1;							//Carries the BCD values from the MUX to the decoder
wire [3:0]display0;							//Carries the BCD values from the MUX to the decoder

reg [1:0]ENABLE;								//Enable boolean
reg [1:0]counter_Enable;					//boolean to enable the counter
reg [1:0]downCounter_Enable;				//boolean to enable the down_Counter
reg [15:0]highScore;							//High score
reg [15:0]currentScore;						//current score
reg [2:0]A;										//Current state of Finite State Machine
reg downCount_Boolean;						//count complete=1  count running=0
reg downCount_Value;							//The LFSR value assigned to the down counter
reg [1:0]displayState;						//Controls the output of display_MUX. 0 = display current score, 1 = display High Score 
 
assign RESET[0] = SW[0];					//Toggles the RESET boolean
assign HEX0[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX1[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX2[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX3[7] = 1'b0;						//Turns ON the decimal point for the 7-segment display
assign HEX4[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX5[7] = 1'b1;						//Turns OFF the decimal point for the 7-segment display
assign HEX4 = 8'b11111111;					//Blanks digit 4 of the 7-segment display
assign HEX5 = 8'b11111111;					//Blanks digit 5 of the 7-segment display
assign LEDR[9] = SW[0];						//indicator for the reset switch
assign LEDR[8] = downCounter_Enable;	//indicator for the downCount_Complete boolean 1=count complete
assign LEDR[7] = counter_Enable;			//indicator for the downCount_Complete boolean 1=count complete
assign LEDR[6] = displayState;			//indicator for the displayState. 0 = display current score, 1 = display High Score 
assign LEDR[5] = downCount_Complete;	//indicator for the downCount_Complete boolean 1=count complete
assign LEDR[4] = downCount_Complete;	//indicator for the downCount_Complete boolean 1=count complete
assign LEDR[3] = downCount_Complete;	//indicator for the downCount_Complete boolean 1=count complete
assign LEDR[2:0] = A[2:0];					//TEMPORARY indicator to show current state of FSM 


always@(A, KEY[1], KEY[0], SW[0], downCount_Boolean, downCount_Complete)
begin
	if(SW[0]==1)begin							//RESET ALL CONDITIONS
		highScore <= 0;
		A<=3'b000;
		counter_Enable <= 0;
		downCounter_Enable <= 0;
		downCount_Boolean <= 0;
		displayState <= 0;
		highScore <= 16'b1111111111111111;
		end

	if(A == 3'b000 && SW[0] ==1'b0 && KEY[1] == 1'b0)begin
		A <= 3'b001;
		counter_Enable <= 0;
		downCounter_Enable <=0;
		//downCount_Complete <=0;
		displayState <= 1;
		end

	else if(A == 3'b001 && downCount_Complete == 0 && KEY[0] == 1'b0)begin  //
		downCounter_Enable <= 1'b1;
		A <= 3'b010;
		downCount_Value = LFSR_Value;
		CLEAR[0]=1'b1;							//Clears the hex display by resetting values to 0								
		displayState <= 0;
		end
	else if(A == 3'b010 && downCount_Complete == 1)begin
		CLEAR[0]=1'b0;							//Clears the hex display by resetting values to 0	
		counter_Enable <= 1;
		downCount_Boolean <= 0;
		downCounter_Enable <=0;
		A <= 3'b011;
		displayState <= 0;
		end
	else if(A == 3'b011 && KEY[0] == 1'b0)begin 
		counter_Enable <= 0;
		downCounter_Enable <=0;
		A <= 3'b000;
		displayState <= 0;	
			if({BCD3,BCD2,BCD1,BCD0} < highScore[15:0])
			highScore[15:0] <= {BCD3,BCD2,BCD1,BCD0};
		
		end
end		
		



//Instantiates an instance of display_MUX.v
//This is the MUX which determines if the display will show the high score or the current score.
display_MUX display_MUX_INST1(displayState, BCD3[3:0], BCD2[3:0], BCD1[3:0], BCD0[3:0], highScore[15:12],highScore[11:8],highScore[7:4], highScore[3:0], display3[3:0], display2[3:0], display1[3:0], display0[3:0]);

//Instantiates an instance of BCD_decoder.v
//This is the decoder which translates BCD values into binary values that light the correct segments in the 7-segment display
BCD_decoder decoder_INST1(display0[3:0], display1[3:0], display2[3:0], display3[3:0], HEX0[6:0], HEX1[6:0], HEX2[6:0], HEX3[6:0]);

//Instantiates an instance of BCD_counter.v
//This code generates the values which generate numbers 1-9 for the seven-segment displays
BCD_counter BCD_Count_INST1(divided_Clock, RESET, CLEAR, counter_Enable, BCD3, BCD2, BCD1, BCD0);

//Instantiates an instance of Clock_divider
//This clock divides the native 50MHz clock by 25,000 to yield a 2kHz clock
clock_Divider clk_Div_INST1(MAX10_CLK1_50, divided_Clock);

//Instantiates an instance of Slow_Clock
//This clock divides the native 50MHz clock by 50,000,000 to yield a 1Hz clock
Slow_Clock Slow_Clock_INST1(MAX10_CLK1_50, Slow_Clock);

//Instantiates an instance  of LFSR 
//Generates pseudo random numbers to set the delay between pressing the start button, and the start of the timer/start indicator light
LFSR LFSR_INST1(Slow_Clock, LFSR_Value);

//instantiates an instance of down_Counter
down_Counter down_Counter_INST1(Slow_Clock, LFSR_Value, RESET, downCounter_Enable, count, downCount_Complete);


endmodule



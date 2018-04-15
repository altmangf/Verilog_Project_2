//Gabriel Altman
//ECEN2350 Digital Logic
//April, 2018

module clock_Divider(clock, divided_Clock, clock_Count );

parameter q = 25000;

input clock;

//output divided_Clock;
output reg divided_Clock;
output reg [25:0]clock_Count;

//reg div;
//reg [25:0]clock_Count;

//wire [25:0]clock_Count;

always@(posedge clock) 
	begin
	clock_Count <= clock_Count + 1;
	if (clock_Count == q)
		begin
		clock_Count <= 0;
		//div <= !div;
		divided_Clock <= !divided_Clock;
		end
	end
//assign divided_Clock = div;	
endmodule

//Gabriel Altman
//ECEN2350 Digital Logic
//April, 2018

module display_MUX(displayState, BCD3, BCD2, BCD1, BCD0, HS3, HS2, HS1, HS0, Display3, Display2, Display1, Display0);

input displayState;
input  [3:0]BCD0;
input  [3:0]BCD1;
input  [3:0]BCD2;
input  [3:0]BCD3;
input  [3:0]HS0;
input  [3:0]HS1;
input  [3:0]HS2;
input  [3:0]HS3;

output reg[6:0]Display0;
output reg[6:0]Display1;
output reg[6:0]Display2;
output reg[6:0]Display3;

always@(displayState)begin
	if(displayState == 1'b0)begin
		Display3 = BCD3;
		Display2 = BCD2;
		Display1 = BCD1;
		Display0 = BCD0;
		end
	else if(displayState == 1'b1)begin
		Display3 = HS3;
		Display2 = HS2;
		Display1 = HS1;
		Display0 = HS0;
		end
end
endmodule

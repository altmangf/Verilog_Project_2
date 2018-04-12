//Gabriel Altman
//ECEN2350 Digital Logic
//April, 2018

module down_Counter(clock, random_Number, clear, ENABLE, count, downCount_Complete);

input clock;
input clear;
input ENABLE;
input [7:0]random_Number;

output reg [7:0]count;
output reg [7:0]downCount_Complete;

//reg current_count[7:0] = random_Number[7:0];

always@(posedge clock) 
	begin
	if (clear)
	begin
		downCount_Complete <= 1'b0;
		count <= 8'b00000000;
	end
	else if(ENABLE)
	count <= count + 1;
	//current_count <= current_count - 1;
	//count = current_count;
	if (count == random_Number)
		begin
		downCount_Complete <= 1'b1;
		//count <= count - 1;
		//count = random_Number;
		//ENABLE <= 0;
		end
	else
		downCount_Complete <= 1'b0;
	end

endmodule
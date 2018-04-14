//Gabriel Altman
//ECEN2350 Digital Logic
//April, 2018
//Based on code from http://www.fpga4fun.com/Counters3.html

module LFSR(CLK1, LFSROutput);

//input KEY0;
input CLK1;

//output [7:0] LFSROutput;

output reg [7:0] LFSROutput = 8'b11111111;


 

wire FEEDBACK = LFSROutput[7];

always @(posedge CLK1)
begin
 //LFSROutput[0] <= 1				//Seed the shift register
  LFSROutput[0] <= FEEDBACK;
  LFSROutput[1] <= LFSROutput[0];
  LFSROutput[2] <= LFSROutput[1];
  LFSROutput[3] <= LFSROutput[2] ^ FEEDBACK; 
  LFSROutput[4] <= LFSROutput[3] ^ FEEDBACK;
  LFSROutput[5] <= LFSROutput[4] ^ FEEDBACK;
  LFSROutput[6] <= LFSROutput[5] ^ FEEDBACK;
  LFSROutput[7] <= LFSROutput[6];
end
endmodule
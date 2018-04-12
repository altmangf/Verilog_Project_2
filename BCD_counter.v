//Gabriel Altman
//ECEN2350 Digital Logic
//April, 2018
//Based on code from the textbook

module BCD_counter (Clock, Clear, ENABLE, BCD3, BCD2, BCD1, BCD0);

input Clock, Clear, ENABLE;
output reg [3:0] BCD3, BCD2, BCD1, BCD0;

always @(posedge Clock)
	begin
		if (Clear)
			begin
			BCD3 <= 0;
			BCD2 <= 0;
			BCD1 <= 0;
			BCD0 <= 0;
			end
		else if (ENABLE)
			if (BCD0 == 4'b1001)
			begin
				BCD0 <= 0;
				if (BCD1 == 4'b1001)
				begin
					BCD1 <= 0;
					if (BCD2 == 4'b1001)
					begin	
						BCD2 <= 0;
						if (BCD3 ==4'b1001)
						begin	
							BCD3 <= 0;
						end
						else
						BCD3 <= BCD3 +1;
					end
					else
					BCD2 <= BCD2 +1;	
				end		
				else
				BCD1 <= BCD1 + 1;
			end
			else
			BCD0 <= BCD0 + 1;
	
	
	
	end
endmodule
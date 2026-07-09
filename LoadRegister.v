module LoadRegister(D_in, D_out, clk, rst, Load);
	// Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: LoadRegister

	//The module receives the 4-bit number entered by a player (D_in) and waits for a high pulse signal (Load)
	// to output that signal (D_out) to the decoders and the adder for display of numbers and their sum.
	//it gets to the intitial state if the reset is pushed (rst)
    
	input[3:0] D_in;
	output[3:0] D_out;
	input clk, rst;
	input Load;
	reg[3:0] D_out;
	always@(posedge clk)
	 begin
	
		//If Reset is pressed, register will sent no number to the decoder because the system was reset

	   if (rst == 1'b0)
		begin
			D_out <=4'b0000;
		end
	   else
		begin
			//If I receive a pulse, the system allows number in D_in to be sent to display
			//Otherwise, D_out will be the same as previously and the display will remain unchanged.
			if (Load==1'b1) 
			begin
				D_out <= D_in;
			end
		end
	end
endmodule
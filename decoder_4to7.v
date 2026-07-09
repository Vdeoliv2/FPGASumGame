module decoder_4to7(decoder_in, decoder_out);
	// Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: decoder_4to7

	//The module takes the input value (decoder_in) and decode it into 7-bit segment (decoder_out)
	// on the decoder_4to7 to be displayed on a displayer in FPGA
	

	input[3:0] decoder_in;
	output[6:0] decoder_out;
	reg[6:0] decoder_out;

	always@(decoder_in)
		begin
			case(decoder_in)
				4'b0000:
					begin
						decoder_out=7'b1000000;
					end
				4'b0001:
					begin
						decoder_out=7'b1111001;
					end
				4'b0010:
					begin
						decoder_out=7'b0100100;
					end
				4'b0011:
					begin
						decoder_out=7'b0110000;
					end
				4'b0100:
					begin
						decoder_out=7'b0011001;
					end
				4'b0101:
					begin
						decoder_out=7'b0010010;
					end
				4'b0110:
					begin
						decoder_out=7'b0000010;
					end
				4'b0111:
					begin
						decoder_out=7'b1111000;
					end
				4'b1000:
					begin
						decoder_out=7'b0000000;
					end
				4'b1001:
					begin
						decoder_out=7'b0011000;
					end
				4'b1010:
					begin
						decoder_out=7'b0001000;
					end
				4'b1011:
					begin
						decoder_out=7'b0000011;
					end
				4'b1100:
					begin
						decoder_out=7'b1000110;
					end
				4'b1101:
					begin
						decoder_out=7'b0100001;
					end
				4'b1110:
					begin
						decoder_out=7'b0000110;
					end
				4'b1111:
					begin
						decoder_out=7'b0001110;
					end
				default:
					begin
						decoder_out=7'b1111111;
					end
    			endcase
		end

endmodule


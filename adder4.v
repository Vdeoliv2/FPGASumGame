module adder4(A, B, S, Matching, Non_matching);
    // Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: adder4

	//The module sum the binary inputs A and B to get the final value S
	// Additionally it checks in that sum equals 15 in hexadecimals and outputs the signal to turn on the correct LED
    //based on the 1-bit output (Matching or Non_matching)
	
	

    input  [3:0] A, B;
    output [3:0] S;
    reg [3:0] S;
    output Matching;
    output Non_matching;
    reg Matching;
    reg Non_matching;

    always @(A, B, S) begin
        S = A + B;
        if(S==4'b1111)
            begin
                Matching = 1'b1;
                Non_matching = 1'b0;
            end
        else
            begin
                Matching = 1'b0;
                Non_matching = 1'b1;
            end
        end
endmodule
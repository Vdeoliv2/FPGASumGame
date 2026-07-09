module RNG(RNG_Gen,clk, rst,Random_num);
    // Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: RNG

	//The module generates a random number between 0 and 15 by pushing a button when player is logged in and the game is on
    //it inverts the low RNG_Gen signal from button push (active low) and wires the resulting signal to an RNG RNG_Counter
    //it will change the count_out output while button is pushed by incrementing 1 from 0 to 15, then restart the cycle until button is released
    //after button is released, the count_out output will remain in its latest value

    input RNG_Gen, clk, rst;
    output [3:0] Random_num;

    wire count_s;
    wire [3:0] count_out_s;

    assign count_s = ~RNG_Gen;
    assign Random_num = count_out_s;

    RNG_Counter RNGCounter(clk, rst, count_s, count_out_s);

endmodule
module ButtonShaper(B_in,B_out,clk,rst);
    // Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: ButtonShaper

	//The module takes the signal of a button being pushed (B_in) and converts is to one high pulse (B_out)
    // so it gets one defined output wherever that button is applied to
    //it gets to the intitial state if the reset is pushed (rst)

    input B_in;
    output B_out;
    input clk, rst;
    reg B_out;
    parameter INIT=0, PULSE=1, WAIT=2;
    reg[1:0] State, Statenext;

    always@(State,B_in)begin
        case(State)
            INIT: begin // waits for the button to be pushed
                B_out=1'b0;
                if(B_in==1'b0)
                    Statenext = PULSE;
                else
                    Statenext = INIT;
                
            end
            PULSE: begin
                B_out=1'b1; // sends only one high pulse signal.
                Statenext = WAIT;
            end
            WAIT: begin
                B_out=1'b0;
                if(B_in==1'b1)
                    Statenext = INIT;
                else
                    Statenext = WAIT;
                
            end
            default: begin // output remains low until the button is released
                B_out=1'b0;
                Statenext = WAIT;
            end
        endcase
    end
always@(posedge clk) begin
        if(rst==1'b0)
        State <= WAIT;
        else
        State <=Statenext;
     end
endmodule


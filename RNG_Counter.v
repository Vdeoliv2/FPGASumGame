module RNG_Counter(clk, rst, count, count_out);
    // Course Number: ECE 5440
    // Author: Victor de Oliveira Venancio, 9048
    // Name of File: RNG_Counter
    //
    // This module is the counter of an RNG that will be attached to an inverter and a button and 
    // will generate a 4-bit random number based on the duration count is high
    // when rst is low, count is 0 and count_out will be 0 as well.
    // Otherwise,
    // While an attached button is pushed(count high), the internal 4-bit count_out increments at each rising clock edge
    // If count_out is 15, however, it will have reached its maximum value and its next value will be 0 again, repeating the cycle
    // When the button is released, count becomes low and count_out will stay as its last output value


    input clk, rst, count;
    output [3:0] count_out;
    reg [3:0] count_out;

    always @(posedge clk) begin
        if (rst == 1'b0) begin
            count_out <= 4'b0000;
        end
        else begin
            if (count == 1'b1) begin
                if(count_out < 4'b1111) begin
                    count_out <= count_out + 4'b0001;
                end
                else begin
                    count_out <= 4'b0000;
                end
            end
        end
    end

endmodule

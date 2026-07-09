module BCD_Counter(RNG_Number, P_number, time_reconfig, Load, clk, rst, score_ones, score_tens);
    // Course Number: ECE 5440
    // Author: Victor de Oliveira Venancio, 9048
    // Name of File: BCD_Counter
    //
    // This module counts the total number of successful rounds in the game.
    // It receives the random number from RNG in RNG_Number and the player's number directly from player's switches.
    // When it receives a load, if the sum between RNG_Number and P_number is 15 it sums 1 to the score defined by score_ones (ones) and score_tens (tens)
    // If time_reconfig is high, the score is set back to 0 preparing the system for a new game.
    // If rst is low, the whole score is also reset to 0.

    input Load, time_reconfig, clk, rst;
    input [3:0] RNG_Number, P_number;
    output [3:0] score_ones, score_tens;
    reg [3:0] score_ones, score_tens;

    always @(posedge clk) begin
        if (rst == 1'b0) begin
            score_ones <= 4'd0;
            score_tens <= 4'd0;
        end
        else if (time_reconfig == 1'b1) begin
            score_ones <= 4'd0;
            score_tens <= 4'd0;
        end
        else begin
            if (Load == 1'b1) begin
                if ((RNG_Number + P_number) == 4'd15) begin
                    if (score_ones < 4'd9) begin
                        score_ones <= score_ones + 4'd1;
                    end
                    else begin
                        if (score_tens < 4'd9) begin
                            score_tens <= score_tens + 4'd1;
                            score_ones <= 4'd0;
                        end
                        else begin
                            score_ones <= 4'd9;
                            score_tens <= 4'd9;
                        end
                    end
                end
            end
        end
    end

endmodule
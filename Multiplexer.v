module Multiplexer(sum, timeOut, score_ones, score_tens, disp_right, disp_left);
    // Course Number: ECE 5440
    // Author: Victor de Oliveira Venancio, 9048
    // Name of File: ScoreSumMux
    //
    // This module selects whether the middle displays show
    // the game sum or the final score based on a switch (Score_mode)
    // when timeOut is high, it displays the total score, otherwise it displays the sum
    // Gameplay starts by pushing the Game Start button
    // or when logged out (rst)
    // which is when disp_left and disp_right display sum in disp_right (timeOut=0)
    // Gameover starts after time out signal comes from timer equal to 00 (timeOut high) 
    // which is when displays show total score in deicmals 
    //(disp_left shows ones portion and disp_right shows tens portion) (timeOut=1)
    // Because the left display (disp_left) should be off during sum output
    // it is connected to a different version of the decoder_4to7 that truns off for input greater than 9
    // that way, for the case to show the sum, a value greater than 9 is assigned to disp_left 
    // to turn its corresponding display off

    input [3:0] sum, score_ones, score_tens;
    input timeOut;

    output [3:0] disp_right, disp_left;

    reg [3:0] disp_right, disp_left;

    // Display selection
    always @(sum or score_ones or score_tens or timeOut) begin
        if (timeOut == 1'b1) begin
            disp_left   = score_tens;
            disp_right  = score_ones;
        end
        else begin
            disp_left   = 4'd15; // Connected to a decoder_4to7_OnOff that will turn display off
            disp_right  = sum;
        end
    end

endmodule
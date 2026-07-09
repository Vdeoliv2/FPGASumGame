module twoDigitTimer(clk, rst, time_enable_s, time_reconfig_s, time_out_s, tens_digit, ones_digit);
    // Course Number: ECE 5440
    //Author: Victor de Oliveira Venancio, 9048
    //Name of File: TwoDigitTimer

    //This is the two digit timer that will receive the time_reconfic from access controller to be set to 99
    //After game start button is pushed time_enable_s becomes high and timer starts to decrease from the
    //1second_timer from count1ms_s, countTo100_s and countTo10_s then it makes the onesDigitTimer decrease its digit by 1 each second by transmitting 
    // a high pulse through s1Timeout_s. When onesDigitTimer outputs 0 it borrows from tensDigitTimer if it is possible and maks the tensDigitTimer decrease its digit by 1
    // if it is not possible, the NBD_1 will output a high pulse signal for AccessController to block buttons turn time_enable off and end the game

    input clk, rst, time_reconfig_s, time_enable_s;
    output time_out_s;
    output [3:0] tens_digit, ones_digit;

    wire ms1Timeout_s, ms100Timeout_s, s1Timeout_s, BD_1, NBD_1, BU_1, NBU_1, BD_10, NBD_10, BU_10;

    count1ms count1ms_s(time_enable_s, clk, rst, ms1Timeout_s);
    countTo100 countTo100_s(time_enable_s, ms1Timeout_s, clk, rst, ms100Timeout_s);
    countTo10 countTo10_s(time_enable_s, ms100Timeout_s, clk, rst, s1Timeout_s);

    assign BD_1 = s1Timeout_s;
    assign BD_10 = BU_1;
    assign NBU_1 = NBD_10;
    assign time_out_s = NBD_1;

    digitTimer onesDigitTimer(BD_1, NBD_1, BU_1, NBU_1, time_reconfig_s, clk, rst, ones_digit);
    digitTimer tensDigitTimer(BD_10, NBD_10, BU_10, 1'b1, time_reconfig_s, clk, rst, tens_digit);

endmodule
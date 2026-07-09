module Lab3_DEOLIVEIRAVENANCIO_Victor(player_switches_x, password_switches_x, RNG_Button_x, load_Button_x, third_button_x, rst_Button_x, output_RNG_x, output_player_x, output_sum_score_right_x, output_timer_right_x, output_sum_score_left_x, output_timer_left_x, Matched_x, Not_matched_x, Logged_in_x, Logged_out_x, CLOCK_50);
    //The module authenticates two players by entering a password that consists of the owner's 4 last digits of ID 
	// by seting Player 2's toggle and pushing the password button for each digit
	// During the game, it takes the values entered by the players when they push their respective load buttons and decode them into 7-bit segments on the decoder_4to7_1 and decoder_4to7_2
	// to represent the hexadeximal numbers corresponding of nput_player1 and password_switches respectively
	//and sum the binary inputs in adder4_1 into sum4 abd decode it through decoder_4to7_3 to output the 7 bit
	// to represent the hexadeximal number resulting from the sum between player_switches and password_switches
	// Additionally it checks in that sum equals 15 in hexadecimals and outputs the signal to turn on the correct LED (leftmost for sum equal 15 and rightmost for sum not equal 15)
	// it gets to the intitial state if the reset is pushed (rst)

    input RNG_Button_x, load_Button_x, third_button_x, rst_Button_x, CLOCK_50;
    input [3:0] player_switches_x;
    input [3:0] password_switches_x;

    output [6:0] output_RNG_x;
    output [6:0] output_player_x;
    output [6:0] output_sum_score_right_x;
    output [6:0] output_timer_right_x;
    output [6:0] output_sum_score_left_x;
    output [6:0] output_timer_left_x;
    output Matched_x;
    output Not_matched_x;
    output Logged_in_x;
    output Logged_out_x;

    wire [3:0] sum_x;
    wire [3:0] to_decoder_and_adder_RNG_x;
    wire [3:0] to_decoder_and_adder_P_x;
    wire [3:0] score_right_x;
    wire [3:0] score_left_x;
    wire [3:0] MUX_right_x;
    wire [3:0] MUX_left_x;
    wire [3:0] timer_right_x;
    wire [3:0] timer_left_x;

    wire RNG_Gen_in_x;
    wire load_p_in_x;
    wire RNG_Gen_out_x;
    wire load_p_out_x;
    wire password_enter_x;
    wire time_reconfig_x;
    wire time_enable_x;
    wire time_out_x;
    wire rst;
    wire clk;

    assign rst = rst_Button_x;
    assign clk = CLOCK_50;
	assign RNG_Gen_in_x = RNG_Button_x;

    ButtonShaper ButtonShaper_1(load_Button_x, load_p_in_x, clk, rst);
    ButtonShaper ButtonShaper_2(third_button_x, password_enter_x, clk, rst);

    AccessController AccessController_1(password_switches_x, password_enter_x, clk, rst, RNG_Gen_in_x, load_p_in_x, RNG_Gen_out_x, load_p_out_x, Logged_in_x, Logged_out_x, time_reconfig_x, time_enable_x, time_out_x);

    RNG RNG1(RNG_Gen_out_x, clk, rst, to_decoder_and_adder_RNG_x);
    LoadRegister LoadRegister_1(player_switches_x, to_decoder_and_adder_P_x, clk, rst, load_p_out_x);

    decoder_4to7 decoder_4to7_1(to_decoder_and_adder_RNG_x, output_RNG_x);
    decoder_4to7 decoder_4to7_2(to_decoder_and_adder_P_x, output_player_x);

    adder4 adder4_1(to_decoder_and_adder_RNG_x, to_decoder_and_adder_P_x, sum_x, Matched_x, Not_matched_x);

    BCD_Counter BCD_Counter_1(to_decoder_and_adder_RNG_x, player_switches_x, time_reconfig_x, load_p_out_x, clk, rst, score_right_x, score_left_x);

    Multiplexer Multiplexer_1(sum_x, time_out_x, score_right_x, score_left_x, MUX_right_x, MUX_left_x);

    decoder_4to7 decoder_4to7_3(MUX_right_x, output_sum_score_right_x);
    decoder_4to7_OnOff decoder_4to7_4(MUX_left_x, output_sum_score_left_x);

    twoDigitTimer twoDigitTimer_1(clk, rst, time_enable_x, time_reconfig_x, time_out_x, timer_left_x, timer_right_x);

    decoder_4to7 decoder_4to7_5(timer_right_x, output_timer_right_x);
    decoder_4to7 decoder_4to7_6(timer_left_x, output_timer_left_x);

endmodule

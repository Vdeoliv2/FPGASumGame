module AccessController(Password_digit, Third_button, clk, rst, RNG_Gen_in, Load_P_in, RNG_Gen_out, Load_P_out, Logged_in, Logged_out, time_reconfig, time_enable, time_out);
	// Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: AccessController

	//The module restricts access to users that are logged in when they enter the password that consists of the woner's 4- last digits
	// each digit is entered in binary form using the 4 leftmost switches in FPGA (Third_button) and pressing the password button to 
    //enter each digit (Third_button)
    //if the authentication is successful it turns on a LED that shows users are logged in (Logged_in)
    //otherwise it keeps on the LED that should they are not logged in (Logged_out)
    // It also has the bonus feature of pressing the password button while logged in to log out
    //it gets to the intitial state if the reset is pushed (rst)
    //if log in is successful it sets a timer to 99 with time_reconfig,
    //it waits for player to pree game start button (Third_button=1) to enable game play (time_enable=1)
    // blocks all buttons if time is over
    // if restarted game (Third_button=1) then it recofigures timer and waits for new game to start
    //Comment: the correct password to log in is 9048
    
    input[3:0] Password_digit;
	output RNG_Gen_out, Load_P_out, Logged_in, Logged_out, time_reconfig, time_enable;
	input clk, rst;
	input Third_button, RNG_Gen_in, Load_P_in, time_out;
    reg RNG_Gen_out, Load_P_out, Logged_in, Logged_out, Flag, time_reconfig, time_enable;
    parameter DIGIT1=0, DIGIT2=1, DIGIT3=2, DIGIT4=3, VERIFY=4, PASSED=5, WAITGAME=6, GAMEPLAY=7, GAMEOVER=8;
	reg[3:0] State;
	always@(posedge clk) begin
        if(rst==1'b0)begin
        RNG_Gen_out <= 1'b1;
            Load_P_out <=1'b0;
            Logged_in <=1'b0;
            Logged_out <=1'b1;
            time_reconfig <=1'b0;
            time_enable <=1'b0;
            State <= DIGIT1;
        end
        else begin
            case(State)
                DIGIT1: begin  //It begins as a log out code
                Flag <=1'b1; //it set flag high as another chance for the user to set the password correctly
                RNG_Gen_out <= 1'b1;
                Load_P_out <=1'b0;
                Logged_in <=1'b0;
                Logged_out <=1'b1;
                time_reconfig <=1'b0;
                time_enable <=1'b0;
                if(Third_button==1'b1)begin
                    if(Password_digit==4'b1001) begin // correct digit is 9
                        State <=DIGIT2; 
                    end
                    else begin
                        Flag <=1'b0; // Password will be incorrect becasue this is not the right digit
                        State <=DIGIT2;
                    end
                end
                else begin
                    State <=DIGIT1; // it waits for a digit to be registered by Third_button
                end
                end

                DIGIT2: begin
                RNG_Gen_out <= 1'b1;
                Load_P_out <=1'b0;
                Logged_in <=1'b0;
                Logged_out <=1'b1;
                time_reconfig <=1'b0;
                time_enable <=1'b0;
                if(Third_button==1'b1)begin
                    if(Password_digit==4'b0000) begin // correct digit is 0
                        State <=DIGIT3;
                    end
                    else begin
                        Flag <=1'b0; // Password will be incorrect becasue this is not the right digit
                        State <=DIGIT3;
                    end
                end
                else begin
                    State <=DIGIT2; // it waits for a digit to be registered by Third_button
                end
                end

                DIGIT3: begin
                RNG_Gen_out <= 1'b1;
                Load_P_out <=1'b0;
                Logged_in <=1'b0;
                Logged_out <=1'b1;
                time_reconfig <=1'b0;
                time_enable <=1'b0;
                if(Third_button==1'b1)begin
                    if(Password_digit==4'b0100) begin // correct digit is 4
                        State <=DIGIT4;
                    end
                    else begin
                        Flag <=1'b0; // Password will be incorrect becasue this is not the right digit
                        State <=DIGIT4;
                    end
                end
                else begin
                    State <=DIGIT3; // it waits for a digit to be registered by Third_button
                end
                end

                DIGIT4: begin
                RNG_Gen_out <= 1'b1;
                Load_P_out <=1'b0;
                Logged_in <=1'b0;
                Logged_out <=1'b1;
                time_reconfig <=1'b0;
                time_enable <=1'b0;
                if(Third_button==1'b1)begin
                    if(Password_digit==4'b1000) begin // correct digit is 8
                        State <=VERIFY;
                    end
                    else begin
                        Flag <=1'b0; // Password will be incorrect becasue this is not the right digit
                        State <=VERIFY;
                    end
                end
                else begin
                    State <=DIGIT4; // it waits for a digit to be registered by Third_button
                end
                end

                VERIFY: begin
                    RNG_Gen_out <= 1'b1;
                    Load_P_out <=1'b0;
                    Logged_in <=1'b0;
                    Logged_out <=1'b1;
                    time_reconfig <=1'b0;
                    time_enable <=1'b0;
                    if(Flag == 1'b1) begin // Password is correct
                        State <= PASSED;
                    end
                    else begin // at least one digit is wrong
                        State <= DIGIT1; //let user try again
                    end
                end

                PASSED: begin
                    RNG_Gen_out <= 1'b1;
                    Load_P_out <= 1'b0;
                    Logged_in <= 1'b1;
                    Logged_out <= 1'b0;
                    Flag <=1'b1;
                    time_reconfig <=1'b1;
                    time_enable <=1'b0;
                    State <= WAITGAME;
                end

                WAITGAME: begin
                    RNG_Gen_out <= 1'b1;
                    Load_P_out <= 1'b0;
                    Logged_in <= 1'b1;
                    Logged_out <= 1'b0;
                    Flag <=1'b1;
                    time_reconfig <=1'b0;
                    time_enable <=1'b0;
                    if(Third_button==1'b1) begin
                        State <= GAMEPLAY;
                    end
                    else begin // at least one digit is wrong
                        State <= WAITGAME;
                    end
                end

                GAMEPLAY: begin
                    RNG_Gen_out <= RNG_Gen_in;
                    Load_P_out <= Load_P_in;
                    Logged_in <= 1'b1;
                    Logged_out <= 1'b0;
                    Flag <=1'b1;
                    time_reconfig <=1'b0;
                    time_enable <=1'b1;
                    if(time_out==1'b1) begin
                        State <= GAMEOVER;
                    end
                    else begin
                        State <= GAMEPLAY;
                    end
                end

                GAMEOVER: begin
                    RNG_Gen_out <= 1'b1;
                    Load_P_out <= 1'b0;
                    Logged_in <= 1'b1;
                    Logged_out <= 1'b0;
                    Flag <=1'b1;
                    time_reconfig <=1'b0;
                    time_enable <=1'b0;
                    if(Third_button==1'b1) begin
                        State <= PASSED;
                    end
                    else begin
                        State <= GAMEOVER;
                    end
                end



                default: begin
                    Flag <=1'b1; //it set flag high as another chance for the user to set the password correctly
                    RNG_Gen_out <= 1'b1;
                    Load_P_out <=1'b0;
                    Logged_in <=1'b0;
                    Logged_out <=1'b1;
                    time_reconfig <=1'b0;
                    time_enable <=1'b0;
                    State <= DIGIT1;
                end
            endcase
        end
	end
endmodule
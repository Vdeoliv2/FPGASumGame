module count1ms(enable, clk, rst, ms1Timeout);
    // Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: count1ms

	//The module checks if reset is not pushed
    //and receives an enable signal from the access controller allowing it to count 50000 clock cycles
    //from the system to get one full millsecond to be sent to the countTo100 module, which will count 100 of those 1ms signals
    //for the next step in the 1 second counter the timer will use to decrease its value by one exactly after 1 second
    // if enable is low, the counter will stop running.

    input enable, clk, rst;
    output ms1Timeout;
    reg ms1Timeout;
    reg [15:0] counter;

    always @(posedge clk) begin
        if (rst == 1'b0 || enable == 1'b0) begin
            ms1Timeout <= 1'b0;
            counter <= 16'd0;
        end
        else begin
            if (counter == 16'd49999) begin
                ms1Timeout <= 1'b1;
                counter <= 16'd0;
            end
            else begin
                ms1Timeout <= 1'b0;
                counter <= counter + 16'd1;
            end
        end
    end
endmodule
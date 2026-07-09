module countTo100(enable, ms1Timeout, clk, rst, ms100Timeout);
    // Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: countTo100

    //The module checks if reset is not pushed
    //and receives an enable signal from the access controller allowing it to count 100 ms (1 high pulse is received every 1 ms)
    //from the system to integrate counts of 100 ms to the countTo10 module, that will  count then of those
    // output signals and get 1 full second
    //the timer will use to decrease its value by one exactly after 1 second
    // if enable is low, the counter will stop running.
    
    input enable, ms1Timeout, clk, rst;
    output ms100Timeout;
    reg ms100Timeout;
    reg [6:0] counter;


    always @(posedge clk) begin
        if (rst == 1'b0 || enable == 1'b0) begin
            ms100Timeout <= 1'b0;
            counter <= 7'd0;
        end
        else begin
            if (ms1Timeout == 1'b1) begin
                if (counter == 7'd99) begin
                    ms100Timeout <= 1'b1;
                    counter <= 7'd0;
                end
                else begin
                    ms100Timeout <= 1'b0;
                    counter <= counter + 7'd1;
                end
            end
            else begin
                ms100Timeout <= 1'b0;
            end
        end
    end
endmodule
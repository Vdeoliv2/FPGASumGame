module countTo10(enable, ms100Timeout, clk, rst, s1Timeout);
    // Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: countTo10

    //The module checks if reset is not pushed
    //and receives an enable signal from the access controller allowing it to count 10 units of 100 ms (1 high pulse is received every 100 ms)
    //from the system to integrate 1 full second
    // the timer will use to decrease its value by one exactly after 1 second
    // if enable is low, the counter will stop running.


    input enable, ms100Timeout, clk, rst;
    output s1Timeout;
    reg s1Timeout;
    reg [3:0] counter;

    always @(posedge clk) begin
        if (rst == 1'b0 || enable == 1'b0) begin
            s1Timeout <= 1'b0;
            counter <= 4'd0;
        end
        else begin
            if (ms100Timeout == 1'b1) begin
                if (counter == 4'd9) begin
                    s1Timeout <= 1'b1;
                    counter <= 4'd0;
                end
                else begin
                    s1Timeout <= 1'b0;
                    counter <= counter + 4'd1;
                end
            end
            else begin
                s1Timeout <= 1'b0;
            end
        end
    end
endmodule
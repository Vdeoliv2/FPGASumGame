module digitTimer(BD, NBD, BU, NBU, reconfig, clk, rst, digit);
    // Course Number: ECE 5440
	//Author: Victor de Oliveira Venancio, 9048
	//Name of File: digitTimer

    //The module manages the digit output for the timer. 
    //Digit is configured to 9 when either it receives a high pulse from reconfig (beginnning of a new game), 
    //or if digit is currently 0 it receives a high pulse from BD (new decrease) and NBU(No_Borrow_Up) is low (Can take a unit from a superior digit)
    //if digit is not 0, NBD (No_Borrow_Down) is low (can be decreased by 1) and if it receives a high pulse from BD (Borrow_down) it will be decreased by 1
    //if digit is currently 0 it receives a high pulse from BD (new decrease) and NBU(No_Borrow_Up) is high (Cannot take a unit from a superior digit)
    //BU remains low, NBD becomes high indicating that time over and cannot be increased again

    input BD, NBU, reconfig, clk, rst;
    output NBD, BU;
    output [3:0] digit;

    reg NBD, BU;
    reg [3:0] digit;

    always @(posedge clk) begin
        if (rst == 1'b0) begin
            BU <= 1'b0;
            NBD <= 1'b0;
            digit <= 4'd0;
        end
        else begin
            BU <= 1'b0;
            if (reconfig == 1'b1) begin // reconfig to 9
                BU <= 1'b0;
                NBD <= 1'b0;
                digit <= 4'd9;
            end
            else begin
                if (BD == 1'b1) begin // asked to decrease
                    if (digit > 4'd1) begin
                        BU <= 1'b0;
                        NBD <= 1'b0;
                        digit <= digit - 4'd1;
                    end
                    else begin // borrow or output NBD high
                        if (NBU == 1'b0) begin // can borrow
                            BU <= 1'b1;
                            NBD <= 1'b0;
                            digit <= 4'd9;
                        end
                        else begin // can't borrow
                            BU <= 1'b0;
                            NBD <= 1'b1;
                            digit <= 4'd0;
                        end
                    end
                end
            end
        end
    end
endmodule
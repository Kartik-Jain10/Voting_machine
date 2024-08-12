module button_pressed(button, candidate, reset, clk, vote_logged, mode);
 input button, reset, clk, mode;
 input [3:0] candidate;
 output reg vote_logged;
 reg [4:0] counter_1;
 always @ (posedge clk)
 begin
    if (reset == 0) begin 
        counter_1 <= 0;
    end
    else begin
        if (button & counter_1 < 5) begin                     // counter for a value of till 4
            counter_1 <= counter_1 + 1;
        end
        else if (!button) begin
            counter_1 <= 0;
        end
    end
 end
 always @ (posedge clk) begin
    if (reset == 0) begin 
        vote_logged <= 1'b0;
    end
    else begin
        if (counter_1 == 4) begin
            vote_logged <= 1'b1;                             // used in valid vote or not in vote_logged module
        end
        else begin
            vote_logged <= 1'b0;
        end
    end
        
        
    end


endmodule
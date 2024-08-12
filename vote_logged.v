module vote_log(vote_logged, candidate,led, clk, reset_all, mode,vote_count_1, vote_count_2, vote_count_3, vote_count_4);
 input [3:0] candidate;
 input vote_logged;
 output reg [7:0] led;
 output reg[7:0]  vote_count_1, vote_count_2, vote_count_3, vote_count_4;
 input clk, reset_all, mode;
 parameter s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0100, s4 = 4'b1000;
 always @ (posedge clk)
 begin
    if (reset_all == 0) begin 
        vote_count_1 <= 0;
        vote_count_2 <= 0;
        vote_count_3 <= 0;
        vote_count_4 <= 0;
        led <= 8'h00;
    end
    else begin
        if (mode==0 & vote_logged) begin
            case (candidate)
                s1: begin vote_count_1 <= vote_count_1 + 1; led <= 8'hff; end
                s2: begin vote_count_2 <= vote_count_2 + 1; led <= 8'hff; end
                s3: begin vote_count_3 <= vote_count_3 + 1; led <= 8'hff; end
                s4: begin vote_count_4 <= vote_count_4 + 1; led <= 8'hff; end
                default : begin vote_count_1 <=  vote_count_1;
        vote_count_2 <= vote_count_2;
        vote_count_3 <= vote_count_3;
        vote_count_4 <= vote_count_4; led <= 8'h00;
        end
        endcase
            
        end
        
        end
    end
endmodule
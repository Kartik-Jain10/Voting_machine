module vote_count(mode, clk, vote_count_1, vote_count_2, vote_count_3, vote_count_4, candidate, led, reset_all, button);
 input [7:0] vote_count_1, vote_count_2, vote_count_3, vote_count_4;
 input [3:0] candidate;
 input mode,clk,reset_all, button;
 output reg [7:0] led;                                                // gives vote count in binary
 parameter s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0100, s4 = 4'b1000;
 always @ (posedge clk) begin
    if (reset_all == 0)begin
        led <= 8'h00;
    end
    else begin
        if (mode == 1 & button) begin
            case (candidate)
            s1 : led <= vote_count_1;
            s2 : led <= vote_count_2;
            s3 : led <= vote_count_3;
            s4 : led <= vote_count_4;
            default : led <= 8'h00;                                    // if two buttons are simultaneously pressed
            endcase
        end
    end
 end
 
endmodule
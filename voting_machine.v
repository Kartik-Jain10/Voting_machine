`include "button_pressed.v"
`include "vote_logged.v"
`include "vote_count.v"
module voting_machine(clk, candidate, mode, button, led_1, led_2, reset);
 input clk, mode, button, reset;
 input [3:0] candidate;
 output[7:0] led_1, led_2;                                       //led_1 = represents valid vote // led_2 = represents vote count;
 wire vote_logged;
 wire [7:0]  vote_count_1, vote_count_2, vote_count_3, vote_count_4;
 button_pressed g1(button, candidate, reset, clk, vote_logged, mode);
 vote_log g2(vote_logged, candidate,led_1, clk, reset, mode,vote_count_1, vote_count_2, vote_count_3, vote_count_4);
 vote_count g3(mode, clk, vote_count_1, vote_count_2, vote_count_3, vote_count_4, candidate, led_2, reset_all, button);
endmodule
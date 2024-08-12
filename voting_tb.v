`include "voting_machine.v"
module voting_machine_tb();
 reg clk;
 reg [3:0] candidate;
 reg mode, button, reset;
 wire [7:0] led_1, led_2;
 initial begin
    clk = 0;
    repeat (400)begin
    #5 clk = 1; #5 clk = 0;
    end
 end
 voting_machine g1(clk, candidate, mode, button, led_1, led_2, reset);
 initial begin
    #2 reset = 0;                                                                             // button can be controlled by external booth officer;
    #10 reset = 1; #10 candidate = 4'b0001; mode = 0; button = 1; #50 button = 0;             // button high means machine is ready for voting;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;                                      // button low means machine will not register the vote;
    #50 button = 1; candidate = 4'b0100; #50 button = 0;
    #50 button = 1; candidate = 4'b0100; #50 button = 0;
    #50 button = 1; candidate = 4'b0100; #50 button = 0;
    #50 button = 1; candidate = 4'b0011; #50 button = 0;
    #50 button = 1; candidate = 4'b0111; #50 button = 0;
    #50 button = 1; candidate = 4'b0011; #50 button = 0;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;
    #50 button = 1; candidate = 4'b0001; #50 button = 0;
    #50 button = 1; candidate = 4'b1000; #50 button = 0;
    #50 button = 1; candidate = 4'b0100; #50 button = 0;
    #50 button = 1; candidate = 4'b0001; #50 button = 0;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;
    #50 button = 1; candidate = 4'b0100; #50 button = 0;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;
    #50 button = 1; candidate = 4'b1000; #50 button = 0;
    #50 button = 1; candidate = 4'b0001; #50 button = 0;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;
    #50 button = 1; candidate = 4'b1000; #50 button = 0;
    #50 button = 1; candidate = 4'b0100; #50 button = 0;
    #50 button = 1; candidate = 4'b0010; #50 button = 0;
    #50 button = 1; candidate = 4'b0000; #50 button = 0;
    #50 button = 1; candidate = 4'b0001; mode = 1; 
    #50 button = 1; candidate = 4'b0010; mode = 1; 
    #50 button = 1; candidate = 4'b0100; mode = 1; 
    #50 button = 1; candidate = 4'b0011; mode = 1; 
    #50 button = 1; candidate = 4'b1000; mode = 1; 
    #50 $finish;
 end
 initial begin
    $display("vote_candidate_1 = %d\n vote_candidate_2 = %d\n vote_candidate_3 = %d\n vote_candidate_4 = %d\n",g1.vote_count_1, g1.vote_count_2, g1.vote_count_3, g1.vote_count_4);
    $dumpfile("votin_tb.vcd");
    $dumpvars(0,voting_machine_tb);
    $monitor("led: %d", g1.led_2);
    #4000 $finish;
 end



endmodule
`timescale 1ns/1ps
module tb_Multiplier_STG_0;
        parameter L_word = 4;
        wire  [2*L_word-1:0]  product;
        wire                  Ready;
        reg    [L_word-1:0]   word1, word2;
        reg                   Start, clock, reset;

        Multiplier_STG_0 module1(.product(product), .Ready(Ready), .word1(word1), .word2(word2),
                                .Start(Start), .clock(clock), .reset(reset));

        initial begin
               $dumpfile("tb_Multiplier_STG_0.vcd");
               $dumpvars(0, tb_Multiplier_STG_0);
               #500 $finish;
        end
        initial begin
                    clock =1'b0;
                    forever #5 clock=~clock;
                end
                initial fork
                    #10 reset = 1;
                    #20 reset = 0;
                    #30 word1= 4'b1000; word2 =  4'b1111; Start =1;
        join

endmodule
	

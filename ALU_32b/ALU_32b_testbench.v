`timescale 1ns / 1ns
module ALU_32b_testbench;
    reg [15:0] A, B;
    reg [1:0] Op;
    reg clk, reset;
    wire [15:0] y;
    
    
    initial clk = 1;
    always
    	#10 clk = ~clk;

    	
 ALU_32b ALU1(y, A, B, clk, reset, Op);
    initial
        begin
            $dumpfile ("ALU_testbench.vcd");
            $dumpvars (0, ALU_32b_testbench);
            #0 A = 16'h0;
            #0 B = 16'h0;  Op = 2'b11;
            
            #10 A = 16'h0; Op = 2'b00;
            
            #15 B = 16'h0; Op = 2'b01;
            
            #20 Op = 2'b10;
            
            #30 Op = 2'b11;    
            #100 $stop;
            $finish ;
        end
    
endmodule

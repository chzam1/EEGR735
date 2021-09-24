`timescale 1ns / 1ns
module full_adder_32b_testbench;
    reg [32:0] a, b;
    reg c_in;
    wire [32:0] sum;
    wire c_out;

full_adder_32b_behavioural adder2(sum, c_out, a, b, c_in);
    initial
        begin
            $dumpfile ("full_adder_32b_testbench.vcd");
            $dumpvars (0, full_adder_32b_testbench);
            #0 a = 0;
            #0 b = 0;
            #0 c_in = 0;
            
            #10 a  = 1;
            #15 c_in = 1;
            #20 b  = 1;
            
            #25 c_in = 1;
            #100 $finish ;
        end
    
endmodule

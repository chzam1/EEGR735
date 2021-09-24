`timescale 1ns / 1ns
module full_adder_testbench;
    reg a, b, c_in;
    wire sum, c_out;

    initial
        begin
            $dumpfile ("full_adder_testbench.vcd");
            $dumpvars (0, full_adder_testbench);
            #0 a = 0;
            #0 b = 0;
            #0 c_in = 0;
            #10 a  = 1;
            #15 c_in = 1;
            #20 b  = 1;
            #25 c_in = 1;
            #30 $stop;
            $finish ;
        end
    full_adder_behavioural adder1(sum, c_out, a, b, c_in);
endmodule

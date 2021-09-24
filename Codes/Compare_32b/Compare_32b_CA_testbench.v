`timescale 1ns / 1ns
module Compare_32b_CA_testbench;
    reg [32:0] A, B;
    wire A_gt_B, A_lt_B, A_eq_B; 

Compare_32b_CA Comparator1(A_gt_B, A_lt_B, A_eq_B, A, B);
    initial
        begin
            $dumpfile ("Compare_32b_CA_testbench.vcd");
            $dumpvars (0, Compare_32b_CA_testbench);
            #0 A = 0;
            #0 B = 0;
            
            #10 A  = 4'b0001;
            
            #15 B = 4'b0001;
            
            #20 A = 4'b0000;
            
            #10 $stop;
            $finish ;
        end
    
endmodule

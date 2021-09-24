//This is the module for 32 bit comparator
module Compare_32b_CA #(parameter w = 32)
                       (output A_gt_B, A_lt_B, A_eq_B, 
                        input [w-1:0] A, B); 
                                  
   
        assign A_gt_B = (A>B);
        assign A_lt_B = (A<B);
        assign A_eq_B = (A==B);
endmodule

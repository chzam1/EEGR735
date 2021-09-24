//This is the behavioural definition of a 32-bit fulladder
module full_adder_32b_behavioural
                          #(parameter w = 32)
                          (output [32:0] sum, 
                           output c_out, 
                           input [w-1:0] a, 
                           input [w-1:0] b,
                           input c_in);
   
 wire [32:0] y;
 assign y = a + b + c_in;
 assign sum = y[0];
 assign c_out = y[1];
endmodule

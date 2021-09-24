//This is the behavioural definition of a 1-bit fulladder
module full_adder_behavioural(output sum, 
                              output c_out, 
                              input a, 
                              input b,
                              input c_in);
   
 wire [1:0] y;
 assign y = a + b + c_in;
 assign sum = y[0];
 assign c_out = y[1];
endmodule

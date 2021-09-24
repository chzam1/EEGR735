//This is the module for 32 bit ALU
module ALU_32b #(parameter w = 16)
                
                (output reg [w-1:0] y,   // ALU 16-bit outputs
                             
                 input [w-1:0] A, B,        // ALU 16-bit inputs
                 
                 input [1:0] Op,           // ALU_Op
                 
                 input clk, reset);
                 
        
         always @(posedge clk, posedge reset)
         	
           begin if (reset == 0) y <= 16'h00000000;  
                else
              case (Op)
               2'b00:  y <= A + B;         // Addition
               
               2'b01:  y <= A - B;         // Subtraction
                
               2'b10:  y <= A & B;         // Bitwise AND
               
               2'b11:  y <= A || B;       // Bitwise OR  
              endcase   
           end


endmodule

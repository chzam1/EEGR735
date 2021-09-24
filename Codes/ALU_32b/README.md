# Arithmetic Logic Unit (ALU)
Arithmetic logic unit (ALU) is a type of combinational logic circuit that is used to implement arithmetic and logic operations in a CPU. Typically, an ALU will receive one or two input operands and return a result along with a set of status bits. The operation will be determined by a selected input.

## Behavioral Verilog code 
This shows the functionality of the design. The ALU is a 32 bit with A and B as its inputs with each having 16 bits, a parameter (w) is giving the value 16 bit to ensure that the inputs A and B are having exactly 16-bit value that is, from 0-15. The output reg (y) shows that y is an output and as well a wire. 

![img](/pix/A1.png)

## Testbench 
The reg are the inputs and the wire y is the output. The clk is initialized at 1ns and at every 10ns it changes from 1 to 0 back to 1 and it continues like that. The inputs A and B are hexadecimal, and the opcode serves as ALU_sellector and is a 2 bits binary as used in the design.

![img](/pix/A2.png)

GTKwave result 

![img](/pix/A3.png)

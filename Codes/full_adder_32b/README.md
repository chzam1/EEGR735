# Full adder
A full adder is a digital component that accepts three inputs, such as A, B, and Carry in, and outputs two outputs, SUM and Carryout, using logic gates. It is the most important component inside a processor's ALU, and it is used to increment addresses, table indexes, buffer pointers, and other locations where addition is necessary. By ORing the final outputs of two half adders, a complete adder can be formed. Because the full adder is a combinational circuit, it may be described using Verilog. Combinational logic is described by a Boolean equation, which is an expression of operations on variables.

![img](/pix/F5.png)

## Verilog code for 32-bit full adder 
Shows the system Verilog code of the behavioral model which is the functionality of the design

![img](/pix/F1_32.png)

## Testbench for full adder 32-bits
This shows the performance of each component and its specific operation. The operation started at time zero for both a, b and Carry_in. Which are both initialized at 0’s, after 10ns, a change to 1, b and Carry_in maintain 0 until it reaches 15ns then Carry_in changes to 1 and at 20ns, b becomes 1 and at 25ns Carry_in maintains 1. Finally, at 100ns the operation stopped.

![img](/pix/F2_32.png)

## GTKwave

![img](/pix/F3_32.png)

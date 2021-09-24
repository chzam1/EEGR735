# HW2

## A Brief Introduction
The Verilog HDL serves as a vehicle for designing, verifying, and synthesizing a circuit. It is also served as a medium for exchanging designs between designers. System Verilog is a Verilog-based Hardware Description and Hardware Verification Language. Module refers to a Verilog code block which implement a functionality of a design. It can be enclosed within other modules and lower-level modules will communicate with higher-level modules using the ports of their input and output. 
A module will be embedded within the endmodule keywords. The module name should be right immediately after the module keyword and an optional port will be declared inside a bracket and a semi colon after the bracket. Therefore, module demonstrates a design unit that implements certain behavioral characteristic which can be converted to a logical circuit during synthesis.
## reg
It is a variable in Verilog which is used in a procedural assignment statement such as sensitivity list within an always block, it denotes register.
Behavioral models include procedural statements that determine how data kinds are manipulated and simulated. These statements are executed under the control of a 'procedure,' which contains a sensitive list that governs the procedure's execution. It could be referring to the most common description styles employed by companies, which allow for the creation of a wide range of chips. It explains a design's functionality, or how the intended circuit will perform.

## Testbench for System Verilog
The testbench, often known as the verification environment, is a collection of classes or components where each component is responsible for a distinct task. Those classes will be called based on the operation, such as generating stimulus, driving, monitoring, and so on.
o $dumpfile is a VCD file that dumps changes in net and register values (value change dump file).
o $dumpvars specifies which variables should be dumped in the filename argument's supplied filename.

## A makefile 
is a program-building tool for Unix, Linux, and other Unix-like operating systems. It simplifies the process of creating software executables that may require multiple modules. Make uses user-defined makefiles to indicate how the modules should be compiled or recompiled together. It's also a command file that informs make how to compile and link a program, i.e., Makefile instructs make how to build and link a program.

## Assign statements 
These are employed to drive values onto wires. As an example, assign a = b & c; This is known as a continuous assign because the wire on the left side of the assignment operator is continually driven by the value of the expression on the right side.

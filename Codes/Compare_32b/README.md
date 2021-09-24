# COMPARATOR
A digital comparator, also known as a magnitude comparator, is a hardware electronic device that compares two binary integers to see if one is greater than, less than, or equal to the other. Central processing units (CPUs)and microcontrollers both use comparators (MCUs).

![img](/pix/C4.png)

This is the system Verilog code of the behavioral model of a comparator the shows the functionality of the design comparator of 32 bit. 

![img](/pix/C1.png)

Comparator testbench that shows the performance of each component and its specific operation. The operation started at time zero for both A and B. Which are both initialized at 0’s, after 10ns, A changes to 1 and B maintain 0 until it reaches 15ns then changes to 1. At 20ns, A becomes 0 and at 100ns the operation stopped.

![img](/pix/C2.png)

This is the result that shows the gtkwave of the comparator at different time interval

![img](/pix/C3.png)


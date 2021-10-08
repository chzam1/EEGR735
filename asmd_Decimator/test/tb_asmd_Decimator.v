`timescale 1ns/1ps
module tb_asmd_Decimator;
        reg clk, rst;
        reg En, Ld;
        reg [7:0] Data;
        wire [15:0] R0;

        asmd_Decimator module1(.R0(R0), .clk(clk), .rst(rst), .Data(Data), .En(En), .Ld(Ld));
                               
                               
        initial
            begin
               $dumpfile("tb_asmd_Decimator.vcd");
               $dumpvars(0, tb_asmd_Decimator);
               #200 $finish;
            end
        initial begin
            clk =1'b0;
            forever #5 clk=~clk;
        end
        initial fork
            #10 rst = 1'b1;
            #15 rst = 1'b0;
            
            #20 En = 1'b0;
            #25 Ld = 1'b0;
            
            #30 En = 1'b1;
            #40 Ld = 1'b0; Data = 8'h80;
           
        join


endmodule
	

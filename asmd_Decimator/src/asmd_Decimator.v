module asmd_Decimator(output [15:0] R0,
                      input [7:0] Data, 
                      input En, Ld,
                      input clk, rst);
       wire Clr_P1_P0, Ld_P1_P0, Ld_R0; //use wire here
       Controller M0(.Clr_P1_P0(Clr_P1_P0), .Ld_P1_P0(Ld_P1_P0), .Ld_R0(Ld_R0), .En(En), .Ld(Ld), .clk(clk), .rst(rst));
       datapath_unit M1(.R0(R0), .Clr_P1_P0(Clr_P1_P0), .Ld_P1_P0(Ld_P1_P0), .Ld_R0(Ld_R0), .Data(Data), .clk(clk), .rst(rst));
endmodule


module Controller (output reg Clr_P1_P0, Ld_P1_P0, Ld_R0, 
                   input En, Ld, clk,  rst); 
parameter s_idle = 2'b00, S_1 = 2'b01,  S_full = 2'b10,  S_wait = 2'b11; 
reg [1:0]  state, next_state; 

 always @(posedge clk) 
  if (rst) state <=  s_idle; 
  else state <= next_state; 

 always @(state, En, Ld) begin 
   Clr_P1_P0 = 0; 
   Ld_P1_P0 = 0;
   Ld_R0 = 0;

     case(state) 
         s_idle: if (En) begin next_state = S_1; Ld_P1_P0 = 1; end 
                 else next_state = s_idle; 

         S_1:    begin next_state = S_full; Ld_P1_P0 = 1; end 

         S_full: if (!Ld) begin next_state = S_wait; Ld_R0 = 1; end 
            else if (En) begin next_state = S_1;  Ld_P1_P0 = 1; end 
            else begin next_state = s_idle; Clr_P1_P0 = 1; end 

        S_wait: if (!Ld) next_state = S_wait; 
            else begin  
              Ld_R0 = 1; 
            if (En) begin Ld_P1_P0 = 1; next_state = S_1; end 
            else begin next_state = s_idle; Clr_P1_P0 = 1; end 
            end  
        default: next_state = s_idle;  
     endcase
 end
endmodule


module datapath_unit (output reg [15:0] R0,
                      input [7:0] Data, 
                      input  Clr_P1_P0, Ld_P1_P0, Ld_R0,
                      input clk, rst);
    reg [7:0]  P0, P1;
    
    always@(posedge clk, posedge rst)
        if (rst == 1'b1) begin
            P1 <= 8'b0;
            P0 <= 0;
        end
        else begin
      
        if (Clr_P1_P0 == 1) begin
            P1 <= 0;
            P0 <= 0;
        end
           
        else if (Ld_P1_P0) begin
          P1 <= Data;
          P0 <= P1; // P1->P0
       end   
        else if (Ld_R0) begin
            R0 <= 16'h70;
        end
            
       
    end
endmodule



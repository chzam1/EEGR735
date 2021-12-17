module Multiplier_STG #(parameter L_word = 4)
                         (output [2*L_word-1:0] product,
                          output                  Ready,
                          input [L_word-1:0] word1, word2,
                          input Start, clock, reset);

wire        m0, Load_words, Shift;

Control_Unit M0_Controller (.Load_words(Load_words), .Shift(Shift), .Add(Add), .Ready(Ready), .m0(m0), .Start(Start), .clock(clock), .reset(reset));

Datapath_Unit M1_Datapath (.product(product), .m0(m0), .word1(word1), .word2(word2), .Load_words(Load_words), .Shift(Shift), .Add(Add), .clock(clock), .reset(reset));
endmodule

module Control_Unit #(parameter L_word = 4, L_state = 4)     //Datapath size, state
                                                              
                     (output reg              Load_words, Shift, Add,
                      output                  Ready,
                      input                   m0, Start, clock, reset);

              reg    [L_state-1:0]          state, next_state;
              parameter                     S_idle = 0, S_1 = 1, S_2 = 2,
                                            S_3 = 3, S_4 = 4, S_5 = 5, S_6 = 6,
                                            S_7 = 7, S_8 = 8;
      assign                                Ready = ((state == S_idle) && !reset)
                                                   || (state == S_8);
always @(posedge clock, posedge reset)     // State transitions

    if (reset == 1'b1) state <= S_idle; else state <= next_state;

always @(state, Start, m0) begin     // Next state and control logic
       Load_words = 0; Shift = 0; Add = 0;  // Default values
  case(state)

      S_idle:                           if (Start) begin Load_words = 1; next_state = S_1; end
                                        else next_state = S_idle;

      S_1:                              if(m0)    begin Add = 1; next_state = S_2; end
                                        else      begin Shift = 1; next_state = S_3; end
      S_2:                                        begin Shift = 1; next_state = S_3; end

      S_3:                              if(m0)    begin Add = 1; next_state = S_4; end
                                        else      begin Shift = 1; next_state = S_5; end
      S_4:                                        begin Shift = 1; next_state = S_5; end
                         
      S_5:                              if(m0)    begin Add = 1; next_state = S_6; end
                                        else      begin Shift = 1; next_state = S_7; end
      S_6:                                        begin Shift = 1; next_state = S_7; end

      S_7:                              if(m0)    begin Add = 1; next_state = S_8; end
                                        else      begin next_state = S_8; end
                                 
      S_8:                              if(Start) begin Load_words = 1; next_state = S_1; end
                                       else next_state = S_8;
                        default             next_state = S_idle;
  endcase
end
endmodule

module Datapath_Unit #(parameter L_word = 4)( 
                       output reg   [2*L_word-1:0]   product,
                       output                        m0,
                       input        [L_word-1:0]     word1, word2,
                       input                         Load_words, Shift, Add, clock, reset);

   reg  [2*L_word-1:0]    multiplicand;
   reg  [L_word-1:0]      multiplier;

   assign                 m0 = multiplier[0];
                   
                   //Register/Datapath Operations

always @(posedge clock, posedge reset) begin
         if   (reset == 1'b1 ) begin multiplier <= 0; multiplicand <= 0; product <= 0; end
         else if (Load_words == 1'b1 ) begin 
              multiplicand <= word1 ;
              multiplier <= word2; product <= 0;
         end
         else if (Shift == 1'b1) product <= product + multiplicand;
end
endmodule 


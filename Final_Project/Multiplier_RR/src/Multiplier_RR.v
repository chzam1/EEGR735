module Multiplier_RR #(parameter L_word = 4)(
                            output   [2*L_word-1:0]  product,
                            output                   Ready,
                            input    [L_word-1:0]    word1, word2,
                            input                    Start, clock, reset);
                            
  wire          Empty, Flush, Shift, Add_shift, Load_words, c_is_ws, p0;

Control_Unit M0_Controller(.Ready(Ready), .Load_words(Load_words), .Flush(Flush), .Add_shift(Add_shift), .Shift(Shift),
                           .Start(Start), .Empty(Empty), .p0(p0), .c_is_ws(c_is_ws), .clock(clock), .reset(reset));

  Datapath_Unit M1_Datapath(.product(product),  .word1(word1), .word2(word2), .Load_words(Load_words), .Flush(Flush), .Add_shift(Add_shift),
                                            .Shift(Shift), .Empty(Empty), .p0(p0), .c_is_ws(c_is_ws), .clock(clock), .reset(reset));

endmodule

module Control_Unit (output Ready, 
                     output reg Load_words, Flush, Add_shift, Shift,
                     input Start, Empty, p0, c_is_ws, clock, reset);
    
        reg       state, next_state;
        parameter S_idle = 0, S_running = 1;
        assign Ready = (state == S_idle) && (!reset);
      
      always @(posedge clock, posedge reset)                       // State transitions
         if (reset == 1'b1) state <= S_idle; else state <= next_state;
      
      always @(state, Start, Empty, p0, c_is_ws) begin              // Comb logic for next state  and outputs
          Flush = 0; Load_words = 0; Shift = 0; Add_shift = 0;
        
         case (state)
             S_idle:                            if (!Start) next_state = S_idle;
                                                else if(Empty) begin next_state = S_idle; Flush = 1; end
                                                else begin Load_words = 1; next_state = S_running; end

             S_running:                         if (c_is_ws) next_state = S_idle;
                                                else if (p0) begin Add_shift = 1; next_state = S_running; end
                                                else begin Shift = 1; next_state = S_running; end
                        
            default:                                       next_state = S_idle;
         endcase
          
      end
     
endmodule

module Datapath_Unit #(parameter L_word = 4, L_count = 3)(
                        output reg [2*L_word:0] product,
                        input [L_word-1:0] word1, word2,
                        input Load_words, Flush, Add_shift, Shift, Empty, p0, c_is_ws, clock, reset);
          
          reg     [L_word-1:0]       multiplicand;
          reg     [L_count-1:0]      counter;
          assign                       Empty = (word1 == 0) || (word2 == 0);
          assign                       p0 = product[0];
          assign                       c_is_ws = (counter == L_word);
          
          
         always @(posedge clock, posedge reset)
                  if (reset == 1'b1 ) begin multiplicand <= 0; product <= 0; counter <= 0; end
                  else begin
                  if (Flush) product <= 0;
                  if (Load_words == 1)
                  begin multiplicand <= word1; product[L_word-1:0] <= word2; counter <= 0; end
                  if (Shift) begin product <= product>>1; counter <= counter + 1; end
                  if (Add_shift) begin
                      product <= {product[2*L_word:L_word] + multiplicand, product[L_word:0]}
                      >>1;
                      counter <= counter + 1;
                  end
         end

endmodule

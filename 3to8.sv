/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 3-8 bit function decoder
 * License: MIT http://opensource.org/licenses/MIT
*/

module 3to8Decoder (input [2:0] f1, f2, f3, output [7:0] function);

  // 
  // 3-to-8 Function Decoder
  // 

  reg fctn_code [2:0];
  
  wire V, f, g, h, i, j, k;

  enum logic [7:0] {ADD = 8'b10000000,
                    INC = 8'b01000000,
                    AND = 8'b00100000,
                    OR  = 8'b00010000,
                    XOR = 8'b00001000,
                    NOT = 8'b00000100,
                 SHIFTL = 8'b00000010,
                   NULL = 8'b00000001) function;

  Relay relay1 (.control(f1),
                .in_3(V),
                .out_hi_3(f),
                .out_lo_3(g) );

  Relay relay2 (.control(f2),
                .in_2(f),
                .in_3(g),
                .out_hi_2(h),
                .out_hi_3(i),
                .out_lo_2(j),
                .out_lo_3(k) );

  Relay relay3 (.control(f3),
                .in_0(h),
                .in_1(i),
                .in_2(j),
                .in_3(k),
                .out_hi_0(ADD),
                .out_hi_1(INC),
                .out_hi_2(AND),
                .out_hi_3(OR),
                .out_lo_0(XOR),
                .out_lo_1(NOT),
                .out_lo_2(SHL));

  always_comb begin
    case (fctn_code)
    default: 
       000 : V = 1;
             $display("ADD = %b",ADD);
       001 : V = 1;
       010 : V = 1;
       011 : V = 1;
       100 : V = 1; 
       101 : V = 1;
       110 : V = 1; 
       111 : V = 1;
    endcase
   end



/*
             h = 1;
             i = 0;
             j = 0; 
             k = 0;
       AND_var = 0;
       OR_var  = 0;
       XOR_var = 0;
       NOT_var = 0;
       end
    if (b == 0 & c == 1) begin
       AND_var = 0;
       OR_var  = 1;
       XOR_var = 1;
       NOT_var = 0;
       end
    if (b == 1 & c == 0) begin
       AND_var = 0;
       OR_var  = 1;
       XOR_var = 1;
       NOT_var = 1;
       end
    if (b == 1 & c == 1) begin
       AND_var = 1;
       OR_var  = 1;
       XOR_var = 0;
       NOT_var = 1;
       end
*/


endmodule

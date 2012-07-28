/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 3-8 bit fctn decoder
 * License: MIT http://opensource.org/licenses/MIT
*/

module ThreeToEightDecoder (input logic [2:0] fctn_code, output op);

  logic f1 = fctn_code[2];
  logic f2 = fctn_code[1];
  logic f3 = fctn_code[0];
  
  wire V, f, g, h, i, j, k;

  logic V_var; 

  enum logic [7:0] {ADD = 8'b10000000,
                    INC = 8'b01000000,
                    AND = 8'b00100000,
                    OR  = 8'b00010000,
                    XOR = 8'b00001000,
                    NOT = 8'b00000100,
                 SHIFTL = 8'b00000010,
                   NULL = 8'b00000001} fctn;

  assign op = fctn;
  assign V = V_var;

  Relay relay1 (.control(f1),
                .in_3(V),
                .out_lo_3(f),
                .out_hi_3(g));

  Relay relay2 (.control(f2),
                .in_2(f),
                .in_3(g),
                .out_lo_2(h),
                .out_lo_3(i),
                .out_hi_2(j),
                .out_hi_3(k) );

  Relay relay3 (.control(f3),
                .in_0(h),
                .in_1(i),
                .in_2(j),
                .in_3(k),
                .out_lo_0(ADD_pin),
                .out_lo_1(INC_pin),
                .out_lo_2(AND_pin),
                .out_lo_3(OR_pin),
                .out_hi_0(XOR_pin),
                .out_hi_1(NOT_pin),
                .out_hi_2(SHIFTL_pin),
                .out_hi_3(NULL_pin) );

  logic [7:0] thing;

  always_comb begin
    V_var = 1;
    thing = {ADD_pin, INC_pin, AND_pin, OR_pin, XOR_pin, 
                         NOT_pin, SHIFTL_pin, NULL_pin};
    fctn = thing;
   end

endmodule

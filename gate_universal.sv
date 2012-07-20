/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 1-bit logic block implements four logic functions at once
 * It was designed in such a way so backfeed cannot occur
 * License: MIT http://opensource.org/licenses/MIT
*/

module GateBlock(b, c, NOT, OR, AND, XOR)

  wire b, c, g, h, f, NOT, OR, AND, XOR;

  Relay relay1 (.control(b),
                in_1(V),
                in_2(V),
                in_3(V),
                out_hi_1(g),
                out_hi_3(NOT),
                out_lo_1(h),
                out_lo_2(OR),
                out_lo_3(f) );

  Relay relay2 (control(c),
                in_1(AND),
                in_1(V),
                in_2(XOR),
                out_hi_2(h),
                out_lo_0(f),
                out_lo_1(OR),
                out_lo_2(g) );

  always_comb begin
    if (b == 0 & c == 0) begin
       AND = 0;
       OR  = 0;
       XOR = 0;
       NOT = 0;
    if (b == 0 & c == 1) begin
       AND = 0;
       OR  = 1;
       XOR = 1;
       NOT = 0;
    if (b == 1 & c == 0) begin
       AND = 0;
       OR  = 1;
       XOR = 1;
       NOT = 1;
    if (b == 1 & c == 1) begin
       AND = 1;
       OR  = 1;
       XOR = 0;
       NOT = 1;
   end

endmodule

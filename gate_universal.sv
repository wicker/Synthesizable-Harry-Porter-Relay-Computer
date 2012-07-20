/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 1-bit logic block implements four logic functions at once
 * It was designed in such a way so backfeed cannot occur
 * License: MIT http://opensource.org/licenses/MIT
*/

module GateBlock()

  wire a, b, g, h, f, NOT, OR, AND, XOR;

  module Relay relay1 (input control(b),
                      inout in_1(V),
                      inout in_2(V),
                      inout in_3(V),
                      inout out_hi_1(g),
                      inout out_hi_3(NOT),
                      inout out_lo_1(h),
                      inout out_lo_2(OR),
                      inout out_lo_3(f) );

  module Relay relay2 (input control(c),
                      inout in_1(AND),
                      inout in_1(V),
                      inout in_2(XOR),
                      inout out_hi_2(h),
                      inout out_hi_3,
                      inout out_lo_0(f),
                      inout out_lo_1(OR),
                      inout out_lo_2(g) );

  always_comb begin
    if (a == 0 & b == 0) begin
       AND = 0;
       OR  = 0;
       XOR = 0;
       NOT = 0;
    if (a == 0 & b == 1) begin
       AND = 0;
       OR  = 1;
       XOR = 1;
       NOT = 0;
    if (a == 1 & b == 0) begin
       AND = 0;
       OR  = 1;
       XOR = 1;
       NOT = 1;
    if (a == 1 & b == 1) begin
       AND = 1;
       OR  = 1;
       XOR = 0;
       NOT = 1;
   end

endmodule

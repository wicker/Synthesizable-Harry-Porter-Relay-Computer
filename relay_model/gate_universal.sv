/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 1-bit logic block implements four logic functions at once
 * It was designed in such a way so backfeed cannot occur
 * License: MIT http://opensource.org/licenses/MIT
*/

module UniversalGateBlock (input b, c, output NOT, OR, AND, XOR);

  wire g, h, f, V;
  reg AND_var, OR_var, XOR_var, NOT_var;

  Relay relay1 (.control(b),
                .in_1(V),
                .in_2(V),
                .in_3(V),
                .out_hi_1(g),
                .out_hi_3(NOT),
                .out_lo_1(h),
                .out_lo_2(OR),
                .out_lo_3(f) );

  Relay relay2 (.control(c),
                .in_0(AND),
                .in_1(V),
                .in_2(XOR),
                .out_hi_2(h),
                .out_lo_0(f),
                .out_lo_1(OR),
                .out_lo_2(g) );


//  b[i] = control(b);
//  c[i] = control(c);

  assign AND = AND_var;
  assign OR = OR_var;
  assign XOR = XOR_var;
  assign NOT = NOT_var; 

  always_comb begin
    if (b == 0 & c == 0) begin
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
   end

endmodule

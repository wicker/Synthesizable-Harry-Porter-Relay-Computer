/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Logic Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module EightBigLogicUnit (input logic [7:0] b, c,
                          output logic [7:0] and, or, xor, not);

  Relay relay1 (.control(f1),
                .in_3(V),
                .out_hi_3(f),
                .out_lo_3(g));

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
                .out_hi_0(ADD_pin),
                .out_hi_1(INC_pin),
                .out_hi_2(AND_pin),
                .out_hi_3(OR_pin),
                .out_lo_0(XOR_pin),
                .out_lo_1(NOT_pin),
                .out_lo_2(SHIFTL_pin),
                .out_lo_3(NULL_pin) );

  always_comb begin
    V_var = 1;
    logic [7:0] = {ADD_pin, INC_pin, 
   end

endmodule

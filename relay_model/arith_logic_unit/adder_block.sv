/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder Block in the ALU. Adder Unit made up of eight of these.
 * License: MIT http://opensource.org/licenses/MIT
*/

module AdderBlock (input wire V, b_bit, c_bit, carry_in, carry_in_n,
                   output wire sum_bit, carry_out, carry_out_n);

  wire f, g, h, i, j, k;
  logic sum_bit_var, carry_out_var, carry_out_n_var;

  Relay relay1 (.control(b_bit),
                .in_0(carry_out),
                .in_1(carry_in),
                .in_2(carry_in_n),
                .in_3(carry_out_n),
                .out_lo_0(f),
                .out_hi_0(g),
                .out_lo_1(h),
                .out_hi_1(i),
                .out_lo_2(i),
                .out_hi_2(h),
                .out_lo_3(j),
                .out_hi_3(k));

  Relay relay2 (.control(c_bit),
                .in_0(carry_in),
                .in_1(V),
                .in_2(sum_bit),
                .in_3(carry_in_n),
                .out_lo_0(g),
                .out_hi_0(f),
                .out_lo_1(j),
                .out_hi_1(g),
                .out_lo_2(h),
                .out_hi_2(i),
                .out_lo_3(k),
                .out_hi_3(j));

endmodule
 

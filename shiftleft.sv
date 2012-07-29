/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Shift Left Circular Module
 * License: MIT http://opensource.org/licenses/MIT
*/

module ShiftLeftCircular (input logic [7:0] b, input logic en_shl,
                          output logic [7:0] shl);

  wire r0,r1,r2,r3,r4,r5,r6,r7;

  logic [7:0] b_var;

  Relay relay1 (.control(en_shl),   // b0-b3
                .in_0(b_var[0]),
                .in_1(b_var[1]),
                .in_2(b_var[2]),
                .in_3(b_var[3]),
                .out_lo_0(r0),
                .out_lo_1(r1),
                .out_lo_2(r2),
                .out_lo_3(r3));

  Relay relay2 (.control(en_shl),   // b_var4-b7
                .in_0(b_var[4]),
                .in_1(b_var[5]),
                .in_2(b_var[6]),
                .in_3(b_var[7]),
                .out_lo_0(r4),
                .out_lo_1(r5),
                .out_lo_2(r6),
                .out_lo_3(r7));

  always_comb begin
    b_var = b;
    shl = {r7,r6,r5,r4,r3,r2,r1,r0};
  end

endmodule

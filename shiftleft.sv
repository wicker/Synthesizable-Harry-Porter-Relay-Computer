/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Shift Left Circular Module
 * License: MIT http://opensource.org/licenses/MIT
*/

module ShiftLeftCircular (input logic [7:0] b, input logic en_shl,
                          output logic [7:0] shl);

  logic r0,r1,r2,r3,r4,r5,r6,r7;

  Relay relay1 (.control(en_shl),   // b0-b3
                .in_0(b0),
                .in_1(b1),
                .in_2(b2),
                .in_3(b3),
                .out_hi_0(),
                .out_hi_1(),
                .out_hi_2(),
                .out_hi_3(),
                .out_lo_0(r1),
                .out_lo_1(r2),
                .out_lo_2(r3),
                .out_lo_3(r4));

  Relay relay2 (.control(en_shl),   // b4-b7
                .in_0(b4),
                .in_1(b5),
                .in_2(b6),
                .in_3(b7),
                .out_hi_0(),
                .out_hi_1(),
                .out_hi_2(),
                .out_hi_3(),
                .out_lo_0(r5),
                .out_lo_1(r6),
                .out_lo_2(r7),
                .out_lo_3(r7));

  always_comb begin
    shl = {r7,r6,r5,r4,r3,r2,r1,r0};
  end

endmodule

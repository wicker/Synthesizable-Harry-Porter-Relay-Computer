/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Shift Left Circular Module
 * License: MIT http://opensource.org/licenses/MIT
*/

module ShiftLeftCircular (input logic [7:0] b, input logic en_shl,
                          output logic [7:0] shl);

  wire r0,r1,r2,r3,r4,r5,r6,r7;
  wire b0,b1,b2,b3,b4,b5,b6,b7;

  assign b0 = b[0];
  assign b1 = b[1];
  assign b2 = b[2];
  assign b3 = b[3];
  assign b4 = b[4];
  assign b5 = b[5];
  assign b6 = b[6];
  assign b7 = b[7];

  assign en_shl_pin = en_shl;

  Relay relay1 (.control(en_shl_pin),   // b0-b3
                .in_0(b7),
                .in_1(b0),
                .in_2(b1),
                .in_3(b2),
                .out_hi_0(r0),
                .out_hi_1(r1),
                .out_hi_2(r2),
                .out_hi_3(r3));

  Relay relay2 (.control(en_shl_pin),   // b_var4-b7
                .in_0(b3),
                .in_1(b4),
                .in_2(b5),
                .in_3(b6),
                .out_hi_0(r4),
                .out_hi_1(r5),
                .out_hi_2(r6),
                .out_hi_3(r7));

  always @(b) begin
    shl = {r7,r6,r5,r4,r3,r2,r1,r0};
  end

endmodule

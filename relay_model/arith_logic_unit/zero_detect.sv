/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Zero Detect Function in the ALU
 * This module detects when the result is all zeros.
 * License: MIT http://opensource.org/licenses/MIT
*/

module ZeroDetect (input logic V, [7:0] result, output logic zero);

  wire f,g,h,i,j,k,l,m;
  wire r0,r1,r2,r3,r4,r5,r6,r7,zero_pin;

  assign r0 = result[0];
  assign r1 = result[1];
  assign r2 = result[2];
  assign r3 = result[3];
  assign r4 = result[4];
  assign r5 = result[5];
  assign r6 = result[6];
  assign r7 = result[7];
  assign zero = zero_pin;

  Relay relay0 (.control(r0),
                .in_3(V),
                .out_lo_3(f));

  Relay relay1 (.control(r1),
                .in_3(f),
                .out_lo_3(g));

  Relay relay2 (.control(r2),
                .in_3(g),
                .out_lo_3(h));

  Relay relay3 (.control(r3),
                .in_3(h),
                .out_lo_3(i));

  Relay relay4 (.control(r4),
                .in_3(i),
                .out_lo_3(k));

  Relay relay5 (.control(r5),
                .in_3(k),
                .out_lo_3(l));

  Relay relay6 (.control(r6),
                .in_3(l),
                .out_lo_3(m));

  Relay relay7 (.control(r7),
                .in_3(m),
                .out_lo_3(zero_pin) );

  always @(result) begin
    #1; 
  end

endmodule


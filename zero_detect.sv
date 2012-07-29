/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Zero Detect Function in the ALU
 * This module detects when the result is all zeros.
 * License: MIT http://opensource.org/licenses/MIT
*/

module ZeroDetect (input logic [7:0] result, output logic zero);

  logic f,g,h,i,j,k,l,m;
  logic V = 1;

  Relay relay0 (.control(result[0]),
                .in_3(V),
                .out_lo_3(f));

  Relay relay1 (.control(result[1]),
                .in_3(f),
                .out_lo_3(g));

  Relay relay2 (.control(result[2]),
                .in_3(g),
                .out_lo_3(h));

  Relay relay3 (.control(result[3]),
                .in_3(h),
                .out_lo_3(i));

  Relay relay4 (.control(result[4]),
                .in_3(i),
                .out_lo_3(k));

  Relay relay5 (.control(result[5]),
                .in_3(k),
                .out_lo_3(l));

  Relay relay6 (.control(result[6]),
                .in_3(l),
                .out_lo_3(m));

  Relay relay7 (.control(result[7]),
                .in_3(m),
                .out_lo_3(zero) );

endmodule


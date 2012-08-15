/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Shift Left Circular Module
 * License: MIT http://opensource.org/licenses/MIT
*/

module ShiftLeft (input logic [7:0] b,
                  output wire [7:0] shl_out);

  logic shl_out_var;
  assign shl_out = shl_out_var;

  always begin
    shl_out_var = {b[6],b[5],b[4],b[3],b[2],b[1],b[0],b[7]};
  end

endmodule


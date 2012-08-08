/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Sixteen bit increment 
 * License: MIT http://opensource.org/licenses/MIT
*/

module SixteenBitIncrement (input [N-1:0] address(addr), 
                            output [N-1:0] result);

  parameter N = 16;

  always @(addr) begin
    #1; 
    assign result = addr;
  end

endmodule


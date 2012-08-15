/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Sixteen bit increment 
 * License: MIT http://opensource.org/licenses/MIT
*/

module SixteenBitInc (Addr_Bus addr_bus, 
                            output wire [16-1:0] INC16_out);

  assign INC16_out = addr_bus.address + 1;

endmodule


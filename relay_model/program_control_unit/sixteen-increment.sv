/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Sixteen bit increment 
 * License: MIT http://opensource.org/licenses/MIT
*/

module SixteenBitInc (Addr_Bus addr_bus,
                      LED_Bus led,
                      output wire [16-1:0] inc_result);

  assign inc_result = addr_bus.address + 1;

endmodule


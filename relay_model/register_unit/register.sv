/* Author: Brian Ledger, Jenner Hanni
 * Project: Harry Porter Relay Computer
 * License: MIT http://opensource.org/licenses/MIT
*/

module Register(input hold, inout val);

   Relay r(.control(val), .in_3(val), .out_hi_3(hold));
   
endmodule

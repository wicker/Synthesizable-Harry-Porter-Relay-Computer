/* Author: Brian Ledger
 * Project: Harry Porter Relay Computer
 * File: Basic relay unit 
 * License: MIT http://opensource.org/licenses/MIT
*/

module Relay(input control,
             inout in_0,
             inout in_1,
             inout in_2,
             inout in_3,
             inout out_hi_0,
             inout out_hi_1,
             inout out_hi_2,
             inout out_hi_3,
             inout out_lo_0,
             inout out_lo_1,
             inout out_lo_2,
             inout out_lo_3);

   tranif0(in_0, out_lo_0, control);
   tranif1(in_0, out_hi_0, control);

   tranif0(in_1, out_lo_1, control);
   tranif1(in_1, out_hi_1, control);

   tranif0(in_2, out_lo_2, control);
   tranif1(in_2, out_hi_2, control);

   tranif0(in_3, out_lo_3, control);
   tranif1(in_3, out_hi_3, control);

endmodule

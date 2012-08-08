/* Original Author: Brian Ledger
 * Modified by Jenner Hanni 
 * Project: Harry Porter Relay Computer 
 * License: MIT http://opensource.org/licenses/MIT 
*/

module EightBitRegister(.*);

   parameter REGISTERS = 8;
   
   assign hold = !load;

   genvar i;

   generate
      for(i=0; i<REGISTERS; i++) begin
	 Register R(hold,val[i]);
      end
   endgenerate

endmodule // EightBitRegister

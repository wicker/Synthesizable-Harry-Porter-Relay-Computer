/* Original Author: Brian Ledger
 * Modified by Jenner Hanni 
 * Project: Harry Porter Relay Computer 
 * License: MIT http://opensource.org/licenses/MIT 
*/

module nBitRegister(input N, load, sel, inout .content(data));

   parameter NUM_REG = N;
   
   assign hold = !load;
   assign val = data;

   genvar i;

   generate
      for(i=0; i<NUM_REG; i++) begin
	 Register R(hold,val[i]);
      end
   endgenerate

endmodule

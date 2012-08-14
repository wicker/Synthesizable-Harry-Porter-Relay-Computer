/* Original Author: Brian Ledger
 * Modified by Jenner Hanni 
 * Project: Harry Porter Relay Computer 
 * License: MIT http://opensource.org/licenses/MIT 
*/

module EightBitRegister(input load, sel, [7:0] content);

   parameter NUM_REG = 8;
   
   assign hold = !load;

   genvar i;

   generate
      for(i=0; i<NUM_REG; i++) begin
	 Register R(hold,content[i]);
      end
   endgenerate

endmodule

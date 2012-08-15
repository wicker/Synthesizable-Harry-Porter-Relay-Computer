/* Original Author: Brian Ledger
 * Modified by Jenner Hanni 
 * Project: Harry Porter Relay Computer 
 * License: MIT http://opensource.org/licenses/MIT 
*/

module ThreeBitRegister(input load, sel, [2:0] content);

   parameter NUM_REG = 3;
   
   assign hold = !load;

   genvar i;

   generate
      for(i=0; i<NUM_REG; i++) begin
	 Register R(hold,content[i]);
      end
   endgenerate

endmodule

/* Author: Brian Ledger 
 * Project: Harry Porter Relay Computer 
 * License: MIT http://opensource.org/licenses/MIT 
*/

module EightBitRegister(.*);
   
   assign hold = !load;

   genvar i;

   generate
      for(i=0; i<8; i++) begin
	 Register R(hold,val[i]);
      end
   endgenerate

  
   
endmodule // EightBitRegister

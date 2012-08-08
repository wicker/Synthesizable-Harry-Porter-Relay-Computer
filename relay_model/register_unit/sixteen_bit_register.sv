/* Author: Jenner Hanni 
 * Project: Harry Porter Relay Computer 
 * License: MIT http://opensource.org/licenses/MIT 
*/

module SixteenBitRegister(.*);

   parameter RELAYS = 16; // how many relays in this register
   
   assign hold = !load;

   genvar i;

   generate
      for(i=0; i<RELAYS; i++) begin
	 Register R(hold,val[i]);
      end
   endgenerate

endmodule

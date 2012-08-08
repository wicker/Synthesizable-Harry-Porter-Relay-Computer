/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for holding incrementer result
 * Address bus output, ctrl bus in, inc_result in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_INC_Result (input [N-1:0] inc_result, .load, .sel, 
                       output .address(addrbus));

  parameter N = 16;

  wire logic [N-1:0] content;

  if (load)
     content = inc_result;
  else if (sel) 
     addrbus = content;

  nBitRegister NReg_ADDR (N, load, sel, content);

endmodule

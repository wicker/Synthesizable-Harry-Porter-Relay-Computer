/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_Addr (inout [N-1:0] .address(addrbus), input .load, .sel);

  parameter N = 16;

  wire logic [N-1:0] content;

  if (load)
     content = addrbus;
  else if (sel) 
     addrbus = content;

  nBitRegister NReg_ADDR (N, load, sel, content);

endmodule

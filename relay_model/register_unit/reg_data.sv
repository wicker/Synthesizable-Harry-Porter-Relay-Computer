/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for data
 * Data bus inout, ctrl bus in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_Data (inout [N-1:0] .data(databus), input .load, .sel);

  parameter N = 8;

  wire logic [N-1:0] content;

  if (load)
     content = databus;
  else if (sel) 
     database = content;

  nBitRegister NReg_DATA (N, load, sel, content);

endmodule

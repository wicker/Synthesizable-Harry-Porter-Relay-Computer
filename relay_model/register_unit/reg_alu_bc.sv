/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for B and C
 * Data bus input, ctrl bus in, alu_result out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_ALU_BC (input b, c, [N-1:0] .data(databus), .load, .sel, 
                   output [N-1:0] alu_result);

  parameter N = 8;

  wire logic [N-1:0] content;

  if (load)
     content = databus;
  else if (sel) 
     alu_result = content;

  nBitRegister NReg_BC (N, load, sel, content);

endmodule

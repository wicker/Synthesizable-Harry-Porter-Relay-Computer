/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for A and D
 * Data bus output, ctrl bus in, alu_result in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_ALU_Result (input [N-1:0] alu_result, .load, .sel, 
                       output [N-1:0] .data(databus));

  parameter N = 8;

  wire logic [N-1:0] content;

  if (load)
     content = alu_result;
  else if (sel) 
     databus = content;

  nBitRegister NReg_AD (N, load, sel, content);

endmodule

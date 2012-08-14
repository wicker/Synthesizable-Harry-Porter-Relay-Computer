/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: The ALU
 * This module just holds the modules and registers.
 * It is entirely structural and passes no signals.
 * License: MIT http://opensource.org/licenses/MIT
*/

module alu (output wire logic zero, sign, carry, [7:0] alu_result,
            input logic [7:0] b, c, [2:0] fctn_code);

  logic [7:0] result, // result is for the internal result bus
              adder_out, logic_out;  // 8-bit operation results

  ThreeToEightDecoder op_decoder (fctn_code, op_code);

  EightBitAdderUnit adder_unit (b, c, adder_out, carry);

  EightBitLogicUnit logic_unit (b, c, logic_out);

  ShiftLeft shift_left (b, shl);

  Enable enable_add (control, line, bus);
  Enable enable_inc (control, line, bus);
  Enable enable_and (control, line, bus);
  Enable enable_or  (control, line, bus);
  Enable enable_xor (control, line, bus); 
  Enable enable_not (control, line, bus); 
  Enable enable_shl (control, line, bus); 

  ResultBus result_bus (result, alu_result);

  ZeroDetect zero_detector (result, zero);

endmodule

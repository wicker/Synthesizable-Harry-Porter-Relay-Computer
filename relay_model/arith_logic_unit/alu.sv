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

  logic enAdd, enINC, enAND, enOR, enXOR, enNOT, enSHL;
  logic [7:0] op_code;

  ThreeToEightDecoder op_decoder (fctn_code, op_code);

  EightBitAdderUnit adder_unit (b, c, adder_out, carry);

  EightBitLogicUnit logic_unit (b, c, logic_out);

  ShiftLeft shift_left (b, shl);

  Enable enable_add (op_code[0], line, bus);
  Enable enable_inc (op_code[1], line, bus);
  Enable enable_and (op_code[2], line, bus);
  Enable enable_or  (op_code[3], line, bus);
  Enable enable_xor (op_code[4], line, bus); 
  Enable enable_not (op_code[5], line, bus); 
  Enable enable_shl (op_code[6], line, bus); 

  ResultBus result_bus (result, alu_result);

  ZeroDetect zero_detector (result, zero);

endmodule

/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: The ALU
 * This module just holds the modules and registers.
 * It is entirely structural and passes no signals.
 * License: MIT http://opensource.org/licenses/MIT
*/

module ALU (input wire V, input logic [7:0] b, c, [2:0] fctn_code,
            output wire zero, carry, [7:0] alu_result, LED_Bus led);

  wire [7:0] result, op_code;
  wire [7:0] adder_out, AND_out, OR_out, XOR_out, NOT_out, SHL_out;

  //
  // Modules
  // 

  ThreeToEightDecoder op_decoder (V, fctn_code, op_code);

  EightBitAdderUnit adder_unit (V, b, c, adder_out, carry);

  EightBitLogicUnit logic_unit (V, b, c, AND_out, OR_out, XOR_out, NOT_out);

  ShiftLeft shift_left (b, SHL_out);

  Enable enable_add (op_code[0], adder_out, result);
  Enable enable_inc (op_code[1], adder_out, result);
  Enable enable_and (op_code[2], AND_out, result);
  Enable enable_or  (op_code[3], OR_out, result);
  Enable enable_xor (op_code[4], XOR_out, result); 
  Enable enable_not (op_code[5], NOT_out, result); 
  Enable enable_shl (op_code[6], SHL_out, result); 

  assign alu_result = result; 

  ZeroDetect zero_detector (V, result, zero);

endmodule

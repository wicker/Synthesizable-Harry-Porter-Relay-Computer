/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: The ALU, which uses eight 1-bit logic blocks which
 * can compute logical AND, OR, XOR, and NOT on all 8 bits.
 * License: MIT http://opensource.org/licenses/MIT
*/

module ALU (input logic [7:0] b, c, 
            input logic [2:0] fctn_code,
            output logic [7:0] alu_result, 
            output logic sign, carry, zero);

  logic [7:0] op, result, // result is for the internal result bus
              add, inc, and, or, xor, not, shl;  // 8-bit operation results


  ThreeToEightDecoder op_decoder (fctn_code, op);

  EightBitAdderUnit adder (b, c, add, inc, carry);

  EightBitLogicUnit logic (b, c, and, or, xor, not);

  ShiftLeft shift_left (b, shl);

  Enable enable_add (control, line, bus);
  Enable enable_inc (control, line, bus);
  Enable enable_and (control, line, bus);
  Enable enable_or  (control, line, bus);
  Enable enable_xor (control, line, bus); 
  Enable enable_not (control, line, bus); 
  Enable enable_shl (control, line, bus); 

  ResultBus result_bus (result, alu_result);

  ZeroDetect zero_detector (iresult, zero);

endmodule

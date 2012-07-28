/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: The ALU, which uses eight 1-bit logic blocks which
 * can compute logical AND, OR, XOR, and NOT on all 8 bits.
 * License: MIT http://opensource.org/licenses/MIT
*/

module ALU (input logic [7:0] b, c, output logic [7:0] alu_result, 
                                    output logic sign, carry, zero);

  ThreeToEightDecoder op_decoder (input logic [2:0] fctn_code, 
                                  output logic [7:0] op);

  EightBitAdderUnit adder (input logic [7:0] b, c, 
                           output logic [7:0] add, inc, 
                           output logic carry);

  EightBitLogicUnit logic (input logic [7:0] b, c, 
                           output logic [7:0] and, or, xor, not);

  ShiftLeft shift_left (input logic [7:0] b, c, 
                        output logic [7:0] shl);

  Enable enable_add (input logic en_add, input logic [7:0] add, 
                     output [7:0] result);
  Enable enable_inc (input logic en_inc, input logic [7:0] inc,
                     output [7:0] result);
  Enable enable_and (input logic en_and, input logic [7:0] and, 
                     output [7:0] result);
  Enable enable_or (input logic en_or, input logic [7:0] or, 
                     output [7:0] result);
  Enable enable_xor (input logic en_xor, input logic [7:0] xor, 
                     output [7:0] result);
  Enable enable_not (input logic en_not, input logic [7:0] not, 
                     output [7:0] result);
  Enable enable_shl (input logic en_shl, input logic [7:0] shl, 
                     output [7:0] result);

  ResultBus result_bus (input logic [7:0] result,
                        output logic [7:0] alu_result);

  ZeroDetect zero_detector (input logic [7:0] result,
                            output logic zero);

endmodule

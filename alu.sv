/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: The ALU, which uses eight 1-bit logic blocks which
 * can compute logical AND, OR, XOR, and NOT on all 8 bits.
 * License: MIT http://opensource.org/licenses/MIT
*/

module ALU (input logic [7:0] b, c, output logic [7:0] result);

ThreeToEightDecoder three_to_eight ();

EightBitAdderUnit adder (input b, c, output op);

EightBitLogicUnit logic (input b, c, output op);

Enable enable_add ();
Enable enable_inc ();
Enable enable_and ();
Enable enable_or ();
Enable enable_xor ();
Enable enable_not ();
Enable enable_shl ();

ResultBus result_bus (output result);

ZeroDetect zero_detector ();

endmodule

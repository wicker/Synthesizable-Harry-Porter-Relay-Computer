/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 3-8 bit fctn decoder testbench
 * License: MIT http://opensource.org/licenses/MIT
*/

module ThreeToEightDecoderTestBench ();

  ThreeToEightDecoder decoder ();

  reg [2:0] fctn_code = 3'b111;

  enum logic [7:0] {ADD = 8'b10000000,
                    INC = 8'b01000000,
                    AND = 8'b00100000,
                    OR  = 8'b00010000,
                    XOR = 8'b00001000,
                    NOT = 8'b00000100,
                 SHIFTL = 8'b00000010,
                   NULL = 8'b00000001} op;

  always_comb begin
    fctn_code = 3'b000;
    $display("op: %s",op);
  end

endmodule

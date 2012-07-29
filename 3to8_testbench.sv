/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 3-8 bit fctn decoder testbench
 * License: MIT http://opensource.org/licenses/MIT
*/

`define ADD_op    = 8'b10000000
`define INC_op    = 8'b01000000
`define AND_op    = 8'b00100000
`define OR_op     = 8'b00010000
`define XOR_op    = 8'b00001000
`define NOT_op    = 8'b00000100
`define SHIFTL_op = 8'b00000010
`define NULL_op   = 8'b00000001

module ThreeToEightDecoderTestBench ();

  logic [7:0] op;
  logic [2:0] fctn_code, fctn_code_reg; // initially set to null

  ThreeToEightDecoder decoder (fctn_code, op);

  assign fctn_code = fctn_code_reg;

  initial begin
    for (fctn_code_reg = 0; fctn_code_reg < 8; fctn_code_reg++) begin
        $display("code: %b",fctn_code_reg);  
        $display("f0 = %b, f1 = %b, f2 = %b",decoder.f0,decoder.f1,decoder.f2);
        $display("e = %b, g = %b",decoder.e,decoder.g);
    end
    $finish;
  end

endmodule

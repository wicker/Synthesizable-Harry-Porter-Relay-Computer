/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: 3-8 bit fctn decoder
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

module ThreeToEightDecoder (input logic [2:0] fctn_code, output logic [7:0] op);

  assign f0 = fctn_code[2];
  assign f1 = fctn_code[1];
  assign f2 = fctn_code[0];
  
  wire V, e, g, h, i, j, k,
       ADD_pin, INC_pin, AND_pin, OR_pin,
       XOR_pin, NOT_pin, SHIFTL_pin, NULL_pin;

  logic V_var;

  assign V = V_var;

  Relay relay0 (.control(f0),
                .in_3(V),
                .out_lo_3(e),
                .out_hi_3(g));

  Relay relay1 (.control(f1),
                .in_2(e),
                .in_3(g),
                .out_lo_2(h),
                .out_lo_3(i),
                .out_hi_2(j),
                .out_hi_3(k) );

  Relay relay2 (.control(f2),
                .in_0(h),
                .in_1(i),
                .in_2(j),
                .in_3(k),
                .out_lo_0(ADD_pin),
                .out_lo_1(INC_pin),
                .out_lo_2(AND_pin),
                .out_lo_3(OR_pin),
                .out_hi_0(XOR_pin),
                .out_hi_1(NOT_pin),
                .out_hi_2(SHIFTL_pin),
                .out_hi_3(NULL_pin) );

    
  initial begin
    V_var = 1;
   end

  always_ff @(f0 || f1 || f2) begin
    op = {ADD_pin, INC_pin, AND_pin, OR_pin, XOR_pin,
    NOT_pin, SHIFTL_pin, NULL_pin};
  end

endmodule

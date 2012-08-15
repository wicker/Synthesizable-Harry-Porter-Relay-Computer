/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Logic Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module OneBitLogicBlock (input wire V, b_in, c_in, 
                         input wire OR_pin, NOT_pin, AND_pin, XOR_pin);
 
  wire f,g,h;

  Relay relay1 (.control(b_in),
                .in_1(V),
                .in_2(V),
                .in_3(V),
                .out_hi_1(g),
                .out_hi_2(OR_out),
                .out_hi_3(h),
                .out_lo_1(f),
                .out_lo_3(NOT_out));

  Relay relay2 (.control(c_in),
                .in_0(AND_out),
                .in_1(V),
                .in_2(XOR_out),
                .out_hi_0(h),
                .out_hi_1(OR_out),
                .out_hi_2(f),
                .out_lo_2(g));

endmodule 

module EightBitLogicUnit (input logic V, [7:0] b, c,
                          output wire [7:0] AND_out, OR_out, XOR_out, NOT_out);

  logic OR_pin0, OR_pin1, OR_pin2, OR_pin3, OR_pin4, OR_pin5, OR_pin6, OR_pin7;
  logic NOT_pin0, NOT_pin1, NOT_pin2, NOT_pin3, NOT_pin4, NOT_pin5, NOT_pin6, NOT_pin7;
  logic AND_pin0, AND_pin1, AND_pin2, AND_pin3, AND_pin4, AND_pin5, AND_pin6, AND_pin7;
  logic XOR_pin0, XOR_pin1, XOR_pin2, XOR_pin3, XOR_pin4, XOR_pin5, XOR_pin6, XOR_pin7;

  OneBitLogicBlock onebitlogic0 (V, b0, c0, OR_pin0, NOT_pin0, AND_pin0, XOR_pin0);
  OneBitLogicBlock onebitlogic1 (V, b1, c1, OR_pin1, NOT_pin1, AND_pin1, XOR_pin1);
  OneBitLogicBlock onebitlogic2 (V, b2, c2, OR_pin2, NOT_pin2, AND_pin2, XOR_pin2);
  OneBitLogicBlock onebitlogic3 (V, b3, c3, OR_pin3, NOT_pin3, AND_pin3, XOR_pin3);
  OneBitLogicBlock onebitlogic4 (V, b4, c4, OR_pin4, NOT_pin4, AND_pin4, XOR_pin4);
  OneBitLogicBlock onebitlogic5 (V, b5, c5, OR_pin5, NOT_pin5, AND_pin5, XOR_pin5);
  OneBitLogicBlock onebitlogic6 (V, b6, c6, OR_pin6, NOT_pin6, AND_pin6, XOR_pin6);
  OneBitLogicBlock onebitlogic7 (V, b7, c7, OR_pin7, NOT_pin7, AND_pin7, XOR_pin7);
  
  assign OR_out = {OR_pin7, OR_pin6, OR_pin5, OR_pin4, OR_pin3, OR_pin2, OR_pin1, OR_pin0}; 
  assign NOT_out = {NOT_pin7,NOT_pin6,NOT_pin5,NOT_pin4,NOT_pin3,NOT_pin2,NOT_pin1,NOT_pin0}; 
  assign AND_out = {AND_pin7,AND_pin6,AND_pin5,AND_pin4,AND_pin3,AND_pin2,AND_pin1,AND_pin0}; 
  assign XOR_out = {XOR_pin7,XOR_pin6,XOR_pin5,XOR_pin4,XOR_pin3,XOR_pin2,XOR_pin1,XOR_pin0}; 

endmodule




/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Instruction decoder in the Sequencer Unit
 * License: MIT http://opensource.org/licenses/MIT
*/

module InstructionDecoder (input logic clock, [1:24] inst_reg, [7:0] fsa_in, 
                           output [33:0] inst_decoder_out);

// This module receives input from the instruction register and the FSA
// in the physical computer it lights LEDs to indicate the correct instruction

// Instructions:
// MOV-8
// ALU
// SETAB
// INC-XY
// LOAD
// STORE
// MOV-16: General
// MOV-16: Halt
// MOV-16: Return/Branch-indirect Instruction
// GOTO: General
// GOTO Variant: SETM 
// GOTO Variant: JUMP
// GOTO Variant: CALL
// GOTO Variant: BNEG
// GOTO Variant: BNC
// GOTO Variant: BZERO
// GOTO Variant: BNZ


  initial begin
  end


  always @() begin
  end

endmodule

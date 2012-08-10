/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Instruction decoder in the Sequencer Unit
 * License: MIT http://opensource.org/licenses/MIT
*/

module InstructionDecoder (input logic clock, [1:24] inst_reg, [23:0] fsa_in, 
                           output [33:0] inst_decoder_out);

// this module contains fifty relays broken up into eight blocks
// cond code register, fetch-incr, derived pulses, mov8/mov16, goto, 
// instdecode/setab/inc16/alu, and two unnamed

// inputs include nineteen derived pulses pA through pT
// and one byte from the instruction register

// outputs to the 43 leds
  
// condition code register: r1,r2,r3,r11,r12,r13
// fetch-increment: r4,r5,r6,r7
// derived pulses: r8,r9,r10
// inst decode/alu/other: r21, r22, r23, r24, r31, r32, r33, r34, r41, r42, r43, r44
// unknown: r14, r15, r25, r35, r45
// goto: r16, r17, r26, r27, r36, r37, r46, r47, r48
// mov8/mov16: r18, r19, r20, r29, r30, r39, r40
// unknown: r49, f50



endmodule

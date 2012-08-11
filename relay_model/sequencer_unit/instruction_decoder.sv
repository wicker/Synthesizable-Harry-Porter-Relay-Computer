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

  Relay relay_r1  (.control(??),
                   .in_0(),
                   .in_1(),
                   .in_2(V),
                   .in_3(V),
                   .out_lo_2(a),
                   .out_lo_3(b),

  Relay relay_r2  (.control(b),
                   .in_0(V),
                   .out_lo_0(c));

  Relay relay_r3  (.control(c),
                   .in_0(d),
                   .in_1(e),
                   .in_2(f),
                   .out_hi_0(carry),
                   .out_hi_1(sign),
                   .out_hi_2(zero));

  Relay relay_r11  (.control(d),
                   .in_0(d),
                   .in_1(V),
                   .out_hi_0(a),
                   .out_lo_1(carry_low);

  Relay relay_r12  (.control(e),
                   .in_0(e),
                   .in_1(V),
                   .out_hi_0(a),
                   .out_hi_1(sign_high));

  Relay relay_r13  (.control(f),
                   .in_0(f),
                   .in_1(V),
                   .out_hi_0(a),
                   .out_lo_1(zero_low),
                   .out_hi_1(zero_high));

// fetch-increment: r4,r5,r6,r7

  Relay relay_r4  (.control(pA),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_2(mem_read),
                   .out_hi_3(sel_pc),

  Relay relay_r5  (.control(pB),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_2(ld_inc),
                   .out_hi_3(ld_inst),

  Relay relay_r6  (.control(pC),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_3(sel_inc),

  Relay relay_r7  (.control(pD),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_2(ld_pc),
                   .out_hi_3(ch_abor),

// derived pulses: r8,r9,r10

  Relay relay_r8  (.control(O),
                   .in_3(V),
                   .out_hi_3(P && pN),

  Relay relay_r9  (.control(H),
                   .in_3(V),
                   .out_hi_3(I && pJ),

  Relay relay_r10 (.control(E),
                   .in_3(V),
                   .out_hi_3(D && pE),

// inst decode/alu/other: r21, r22, r23, r24, r31, r32, r33, r34, r41, r42, r43, r44

  Relay relay_r21 (.control(inst7), // done
                   .in_0(V),
                   .out_lo_0(g),
                   .out_hi_0(h));

  Relay relay_r22 (.control(i),     // done
                   .in_0(inst0),
                   .in_1(inst1),
                   .in_2(inst2),
                   .in_3(inst3),
                   .out_hi_0(d0),
                   .out_hi_1(d1),
                   .out_hi_2(d2),
                   .out_hi_3(d3));

  Relay relay_r23 (.control(i),     // done 
                   .in_0(inst4),
                   .in_1(inst4),
                   .in_2(inst4),
                   .in_3(inst4),
                   .out_hi_0(d4),
                   .out_hi_1(d5),
                   .out_hi_2(d6),
                   .out_hi_3(d7));

  Relay relay_r24 (.control(setab), // done
                   .in_0(pE),
                   .in_1(pD_high),
                   .in_3(abort8),
                   .out_hi_0(i),
                   .out_hi_1(j),
                   .out_hi_3(ch_abt));

  Relay relay_r31 (.control(inst6),  // done
                   .in_0(h),
                   .in_1(g),
                   .out_lo_0(k),
                   .out_hi_0(goto),
                   .out_lo_1(mov8),
                   .out_hi_1(setab));

  Relay relay_r32 (.control(inc16), // done
                   .in_0(pI_high),
                   .in_1(pH),
                   .in_2(pG_high),
                   .in_3(pF),
                   .out_hi_0(ld_xy),
                   .out_hi_1(sel_inc),
                   .out_hi_2(ld_inc),
                   .out_hi_3(sel_xy));

  Relay relay_r33 (.control(inc16),  // done
                   .in_3(ch_abt),
                   .out_hi_3(abort14));

  Relay relay_r34 (.control(alu),    // done
                   .in_0(pE),
                   .in_1(pD_high),
                   .in_2(pD_high),
                   .in_3(ch_abt),
                   .out_hi_0(m),
                   .out_hi_1(n),
                   .out_hi_2(ld_cond),
                   .out_hi_3(abort8));

  Relay relay_r41 (.control(inst5),  //  done
                   .in_0(k),
                   .in_1(j),
                   .out_lo_0(l),
                   .out_hi_0(o),
                   .out_lo_1(ld_a),
                   .out_hi_1(ld_b));

  Relay relay_r42 (.control(inst4),  // done
                   .in_0(o),
                   .in_1(l),
                   .out_lo_0(mov16),
                   .out_hi_0(inc16),
                   .out_lo_1(alu),
                   .out_hi_1(q));

  Relay relay_r43 (.control(inst3), // done
                   .in_0(q),
                   .in_1(n),
                   .out_lo_0(load),
                   .out_hi_0(store),
                   .out_lo_1(ld_a),
                   .out_hi_1(ld_b));

  Relay relay_r44 (.control(m),   // done
                   .in_1(f3),
                   .in_2(f2),
                   .in_3(f1),
                   .out_lo_1(V),
                   .out_hi_1(inst2),
                   .out_lo_2(V),
                   .out_hi_2(inst1),
                   .out_lo_3(V),
                   .out_hi_3(inst0));

// load store relays: r14, r15, r25, r35, r45

  Relay relay_r14 (.control(store),   // done
                   .in_0(pK_plus),
                   .in_1(pJ),
                   .in_2(pJ),
                   .in_3(ch_abt),
                   .out_hi_0(mem_write),
                   i.out_hi_1(sel_m),
                   .out_hi_2(r),
                   .out_hi_3(abort_12));

  Relay relay_r15 (.control(load),   // done
                   .in_0(pJ),
                   .in_1(pJ),
                   .in_2(pK_plus),
                   .in_3(ch_abt),
                   .out_hi_0(mem_read),
                   .out_hi_1(sel_m),
                   .out_hi_2(s),
                   .out_hi_3(abort_12));

  Relay relay_r25 (.control(inst1),   // done
                   .in_0(r),
                   .in_1(s),
                   .out_lo_0(t),
                   .out_hi_0(u),
                   .out_lo_1(v),
                   .out_hi_1(w));

  Relay relay_r35 (.control(inst0),   // done
                   .in_0(u),
                   .in_1(t),
                   .in_2(w),
                   .in_3(v),
                   .out_lo_0(sel_c),
                   .out_hi_0(sel_d),
                   .out_lo_1(sel_a),
                   .out_hi_1(sel_b),
                   .out_lo_2(ld_c),
                   .out_hi_2(ld_d),
                   .out_lo_3(ld_a),
                   .out_hi_3(ld_b));

  Relay relay_r45 (.control(store),   // done 
                   .in_0(pJ),
                   .out_lo_0(bus_to_mem??));

  Relay relay_r49 (.control(mem_read),   // done 
                   .in_0(V),
                   .in_1(V),
                   .out_hi_0(sel_m),
                   .out_hi_1(mem_read));

// goto: r16, r17, r26, r27, r36, r37, r46, r47, r48


// mov8/mov16: r18, r19, r20, r29, r30, r39, r40


// unknown: f50

endmodule

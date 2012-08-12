/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Instruction decoder in the Sequencer Unit
 * License: MIT http://opensource.org/licenses/MIT
*/

module InstructionDecoder (input logic clock, [1:24] inst_reg, [18:0] fsa_out, [2:0] ccr,);

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
// load store relays: r14, r15, r25, r35, r45
// goto: r16, r17, r26, r27, r28, r36, r37, [r46, r47, r48]
// mov8/mov16: r18, r19, r20, r29, r30, r39, r40
// unknown: f50

  wire pA,pB,pC,pD,pE,pF,pG,pH,pI,pJ,pK,pL,pM,pN,pO,pQ,pR,pS,pT;

  assign pA = fsm_out[1];
  assign pB = fsm_out[2];
  assign pC = fsm_out[3];
  assign pD = fsm_out[4];
  assign pE = fsm_out[5];
  assign pF = fsm_out[6];
  assign pG = fsm_out[7];
  assign pH = fsm_out[8];
  assign pI = fsm_out[9];
  assign pJ = fsm_out[10];
  assign pK = fsm_out[11];
  assign pL = fsm_out[12];
  assign pM = fsm_out[13];
  assign pN = fsm_out[14];
  assign pO = fsm_out[15];
  assign pQ = fsm_out[16];
  assign pR = fsm_out[17];
  assign pS = fsm_out[18];
  assign pT = fsm_out[19];

  Relay relay_r1  (.control(reg_CCR.load),
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

  Relay relay_r4  (.control(pA),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_2(memory.mem_read),
                   .out_hi_3(reg_PC.sel),

  Relay relay_r5  (.control(pB),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_2(reg_INC.load),
                   .out_hi_3(reg_INST.load),

  Relay relay_r6  (.control(pC),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_3(reg_INC.sel),

  Relay relay_r7  (.control(pD),
                   .in_2(V),
                   .in_3(V),
                   .out_hi_2(reg_PC.load),
                   .out_hi_3(ch_abort),


  Relay relay_r8  (.control(pO),
                   .in_3(V),
                   .out_hi_3(P,pN),

  Relay relay_r9  (.control(pH),
                   .in_3(V),
                   .out_hi_3(I,pJ),

  Relay relay_r10 (.control(pE),
                   .in_3(V),
                   .out_hi_3(D,pE),

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

  Relay relay_r14 (.control(store),   // done
                   .in_0(pK_plus),
                   .in_1(pJ),
                   .in_2(pJ),
                   .in_3(ch_abort),
                   .out_hi_0(memory.mem_write),
                   .out_hi_1(reg_M.sel),
                   .out_hi_2(r),
                   .out_hi_3(abort12));

  Relay relay_r15 (.control(load),   // done
                   .in_0(pJ),
                   .in_1(pJ),
                   .in_2(pK_plus),
                   .in_3(ch_abort),
                   .out_hi_0(memory.mem_read),
                   .out_hi_1(reg_M.sel),
                   .out_hi_2(s),
                   .out_hi_3(abort12));

  Relay relay_r16 (.control(goto),   // done
                   .in_0(pL),
                   .in_1(pQ),
                   .in_2(pM_plus),
                   .in_3(pR_plus),
                   .out_hi_0(reg_INC.sel),
                   .out_hi_1(reg_INC.sel),
                   .out_hi_2(reg_PC.ld),
                   .out_hi_3(x));

  Relay relay_r17 (.control(goto),   // done 
                   .in_0(reg_J.sel),
                   .in_1(y),
                   .in_2(z),
                   .in_3(aa),
                   .out_hi_0(pS),
                   .out_hi_1(pT_plus),
                   .out_hi_2(pK_plus),
                   .out_hi_3(pO_plus));

  Relay relay_r18 (.control(mov16),   // 
                   .in_0(pF),
                   .in_1(pG_plus),
                   .in_2(ch_abort),
                   .out_hi_0(am),
                   .out_hi_1(av),
                   .out_hi_2(abort10));

  Relay relay_r19 (.control(inst5),   // 
                   .in_3(ak),
                   .out_lo_3(af),
                   .out_hi_3(ae));

  Relay relay_r20 (.control(inst4),   // 
                   .in_2(ae),
                   .in_3(af),
                   .out_lo_2(ag),
                   .out_hi_2(ah),
                   .out_lo_3(ai),
                   .out_hi_3(aj));

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
                   .in_1(inst5),
                   .in_2(inst6),
                   .in_3(inst7),
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
                   .out_hi_3(ch_abort));

  Relay relay_r25 (.control(inst1),   // done
                   .in_0(r),
                   .in_1(s),
                   .out_lo_0(t),
                   .out_hi_0(u),
                   .out_lo_1(v),
                   .out_hi_1(w),
                   .out_hi_2(zero_low));

  Relay relay_r26 (.control(x),   // 
                   .in_0(inst0),
                   .out_hi_0(reg_XY.load),
                   .out_hi_3(reg_PC.load));

  Relay relay_r27 (.control(z),   // 
                   .in_0(V),
                   .in_1(V),
                   .out_hi_0(reg_INC.load),
                   .out_hi_1(ab));

  Relay relay_r28 (.control(y),   // 
                   .in_3(ad),
                   .out_hi_3(reg_PC.load));

  Relay relay_r29 (.control(mov8),   // 
                   .in_0(pD_plus),
                   .in_1(pC),
                   .in_2(ch_abort),
                   .out_hi_0(ak),
                   .out_hi_1(al),
                   .out_hi_2(abort8));

  Relay relay_r30 (.control(inst3),   // 
                   .in_0(ah),
                   .in_1(ag),
                   .in_2(aj),
                   .in_3(ai),
                   .out_lo_0(reg_X.load),
                   .out_hi_0(reg_Y.load),
                   .out_lo_1(reg_M1.load),
                   .out_hi_1(reg_M2.load),
                   .out_lo_2(reg_C.load),
                   .out_hi_2(reg_D.load),
                   .out_lo_3(reg_A.load),
                   .out_hi_3(reg_B.load));

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
                   .out_hi_0(reg_XY.load),
                   .out_hi_1(reg_INC.sel),
                   .out_hi_2(reg_INC.load),
                   .out_hi_3(reg_XY.sel));

  Relay relay_r33 (.control(inc16),  // done
                   .in_3(ch_abt),
                   .out_hi_3(abort14));

  Relay relay_r34 (.control(alu),    // done
                   .in_0(pE),
                   .in_1(pD_high),
                   .in_2(pD_high),
                   .in_3(ch_abort),
                   .out_hi_0(m),
                   .out_hi_1(n),
                   .out_hi_2(reg_CCR.load),
                   .out_hi_3(abort8));

  Relay relay_r35 (.control(inst0),   // done
                   .in_0(u),
                   .in_1(t),
                   .in_2(w),
                   .in_3(v),
                   .out_lo_0(reg_C.sel),
                   .out_hi_0(reg_D.sel),
                   .out_lo_1(reg_A.sel),
                   .out_hi_1(reg_B.sel),
                   .out_lo_2(reg_C.load),
                   .out_hi_2(reg_D.load),
                   .out_lo_3(reg_A.load),
                   .out_hi_3(reg_B.load));

  Relay relay_r36 (.control(goto),   // 
                   .in_0(pJ),
                   .in_1(pJ),
                   .in_2(pN),
                   .in_3(pN),
                   .out_hi_0(reg_PC.sel),
                   .out_hi_1(memory.mem_read),
                   .out_hi_2(reg_PC.sel),
                   .out_hi_3(memory.mem_read));

  Relay relay_r37 (.control(aa),   // 
                   .in_0(V),
                   .in_1(V),
                   .out_hi_0(reg_INC.load),
                   .out_hi_1(ac));

  Relay relay_r38 (.control(inst2),   // 
                   .in_0(ad),
                   .in_2(ai),
                   .in_3(am),
                   .out_hi_0(zero_high),
                   .out_lo_2(an),
                   .out_hi_2(ao),
                   .out_lo_3(ap),
                   .out_hi_3(aq));

  Relay relay_r39 (.control(inst1),   // 
                   .in_0(aq),
                   .in_1(ap),
                   .in_2(ao),
                   .in_3(an),
                   .out_lo_0(reg_J.sel),
                   .out_hi_0(halt),
                   .out_lo_1(reg_M.sel),
                   .out_hi_1(reg_XY.sel),
                   .out_lo_2(ar),
                   .out_hi_2(as),
                   .out_lo_3(at),
                   .out_hi_3(au));

  Relay relay_r40 (.control(inst0),   // 
                   .in_0(as),
                   .in_1(ar),
                   .in_2(au),
                   .in_3(at),
                   .out_lo_0(reg_X.sel
                   .out_hi_0(reg_Y.sel),
                   .out_lo_1(reg_M1.sel),
                   .out_hi_1(reg_M2.sel),
                   .out_lo_2(reg_C.sel),
                   .out_hi_2(reg_D.sel),
                   .out_lo_3(reg_A.sel),
                   .out_hi_3(reg_B.sel));

  Relay relay_r41 (.control(inst5),  //  done
                   .in_0(k),
                   .in_1(j),
                   .in_2(ab),
                   .in_3(ac),
                   .out_lo_0(l),
                   .out_hi_0(o),
                   .out_lo_1(reg_a.load),
                   .out_hi_1(reg_b.load),
                   .out_lo_2(reg_M1.load),
                   .out_hi_2(reg_J1.load),
                   .out_lo_3(reg_M2.load),
                   .out_hi_3(reg_J2.load));

  Relay relay_r42 (.control(inst4),  // done
                   .in_0(o),
                   .in_1(l),
                   .in_2(ad),
                   .out_lo_0(mov16),
                   .out_hi_0(inc16),
                   .out_lo_1(alu),
                   .out_hi_1(q),
                   .out_hi_2(sign_high));

  Relay relay_r43 (.control(inst3), // done
                   .in_0(q),
                   .in_1(n),
                   .in_2(ad),
                   .in_3(av),
                   .out_lo_0(load),
                   .out_hi_0(store),
                   .out_lo_1(reg_A.load),
                   .out_hi_1(reg_B.load),
                   .out_hi_2(carry_high),
                   .out_lo_3(reg_XY.load),
                   .out_hi_3(reg_PC.load));

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

  Relay relay_r45 (.control(store),   // done 
                   .in_0(pJ),
                   .out_lo_0(memory.bus_to_mem));

  Relay relay_r49 (.control(mem_read),   // done 
                   .in_0(V),
                   .in_1(V),
                   .out_hi_0(reg_M.sel),
                   .out_hi_1(memory.mem_read));

endmodule

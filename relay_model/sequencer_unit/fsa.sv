/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Finite State Automata module depends on clock to drive computer
 * License: MIT http://opensource.org/licenses/MIT
*/

module FSA (input logic clock, V, reset, output [22:0] fsm_out);

  wire cl0,cl1,cl2,cl3,cl4,cl5,cl6,cl7,cl8,
  wire cl9,cl10,cl12,cl13,cl14,cl15,cl16,cl17,
  wire cl18,cl19,cl20,cl21,cl22,cl23,cl24;

  logic [22:0] fsm_out_var;
  assign fsm_out = fsm_out_var;

  wire reset,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W;

  wire reset_prime, A_prime, B_prime, C_prime, D_prime, E_prime, F_prime, 
       G_prime, H_prime, I_prime, J_prime, K_prime, L_prime, M_prime, 
       N_prime, O_prime, Q_prime, R_prime, S_prime, T_prime, U_prime, 
       V_prime, W_prime; 

  wire t_0_1, t_1_2, t_2_3, t_3_4, t_4_5, t_5_6, t_6_7, t_7_8, t_8_9, t_9_10,
       t_10_11, t_11_12, t_12_13, t_13_14, t_14_15, t_15_16, t_16_17, t_17_18,
       t_18_19, t_19_20, t_20_21, t_21_22, t_22_23;

  wire t_0_2, t_1_3, t_2_4, t_3_5, t_4_6, t_5_7, t_6_8, t_7_9, t_8_10, t_9_11,
       t_10_12, t_11_13, t_12_14, t_13_15, t_14_16, t_15_17, t_16_18, t_17_19,
       t_18_20, t_19_21, t_20_22, t_21_23, t_22_rst;

  wire abort8, abort10, abort12, abort14;

  Relay relay_c0 (.control(clock),
                   .in_0(V),
                   .in_1(V),
                   .in_2(V),
                   .in_3(V),
                   .out_lo_0(cl0),
                   .out_hi_0(cl1),
                   .out_lo_1(cl2),
                   .out_hi_1(cl3),
                   .out_lo_2(cl4),
                   .out_hi_2(cl5),
                   .out_lo_3(cl6),
                   .out_hi_3(cl7));

  Relay relay_c1 (.control(clock),
                   .in_0(V),
                   .in_1(V),
                   .in_2(V),
                   .in_3(V),
                   .out_lo_0(cl8),
                   .out_hi_0(cl9),
                   .out_lo_1(cl10),
                   .out_hi_1(cl11),
                   .out_lo_2(cl12),
                   .out_hi_2(cl13),
                   .out_lo_3(cl14),
                   .out_hi_3(cl15));

  Relay relay_c2 (.control(clock),
                   .in_0(V),
                   .in_1(V),
                   .in_2(V),
                   .in_3(V),
                   .out_lo_0(cl16),
                   .out_hi_0(cl17),
                   .out_lo_1(cl18),
                   .out_hi_1(cl19),
                   .out_lo_2(cl20),
                   .out_hi_2(cl21),
                   .out_lo_3(cl22),
                   .out_hi_3(cl23));

  Relay relay_rst (.control(reset),
                   .in_0(reset),
                   .in_1(A_prime),
                   .in_2(cl0),
                   .in_3(V),
                   .out_hi_0(t_0_2),
                   .out_hi_1(t_0_1),
                   .out_hi_2(t_0_1),
                   .out_hi_3(reset_prime));

  Relay relay_s1 (.control(t_0_1),
                   .in_0(t_0_1),
                   .in_1(B_prime),
                   .in_2(cl1),
                   .in_3(V),
                   .out_hi_0(t_1_3),
                   .out_hi_1(t_1_2),
                   .out_hi_2(t_1_2),
                   .out_lo_3(A_prime),
                   .out_hi_3(A));

  Relay relay_s2 .control(t_1_2),
                   .in_0(t_1_2),
                   .in_1(C_prime),
                   .in_2(cl2),
                   .in_3(V),
                   .out_hi_0(t_2_4),
                   .out_hi_1(t_2_3),
                   .out_hi_2(t_2_3),
                   .out_lo_3(t_0_2),
                   .out_hi_3(B));

  Relay relay_s3 (.control(t_2_3),
                   .in_0(t_2_3),
                   .in_1(D_prime),
                   .in_2(cl3),
                   .in_3(V),
                   .out_hi_0(t_3_5),
                   .out_hi_1(t_3_4),
                   .out_hi_2(t_3_4),
                   .out_lo_3(t_1_3),
                   .out_hi_3(C));

  Relay relay_s4 (.control(t_3_4),
                   .in_0(t_3_4),
                   .in_1(E_prime),
                   .in_2(cl4),
                   .in_3(V),
                   .out_hi_0(t_4_6),
                   .out_hi_1(t_4_5),
                   .out_hi_2(t_4_5),
                   .out_lo_3(t_2_4),
                   .out_hi_3(D));

  Relay relay_s5 (.control(t_4_5),
                   .in_0(t_4_5),
                   .in_1(F_prime),
                   .in_2(cl5),
                   .in_3(V),
                   .out_hi_0(t_5_7),
                   .out_hi_1(t_5_6),
                   .out_hi_2(t_5_6),
                   .out_lo_3(t_3_5),
                   .out_hi_3(E));

  Relay relay_s6 (.control(t_5_6),
                   .in_0(t_5_6),
                   .in_1(G_prime),
                   .in_2(cl6),
                   .in_3(V),
                   .out_hi_0(t_6_8),
                   .out_hi_1(t_6_7),
                   .out_hi_2(t_6_7),
                   .out_lo_3(t_4_6),
                   .out_hi_3(F));

  Relay relay_s7 (.control(t_6_7),
                   .in_0(t_6_7),
                   .in_1(H_prime),
                   .in_2(cl7),
                   .in_3(V),
                   .out_hi_0(t_7_9),
                   .out_hi_1(t_7_8),
                   .out_hi_2(t_7_8),
                   .out_lo_3(t_5_7),
                   .out_hi_3(G));

  Relay relay_abort8 (.control(abort8),
                   .in_0(abort8),
                   .in_1(t_7_8),
                   .out_hi_0(pA_prime),
                   .out_hi_1(reset));

  Relay relay_s8 (.control(abort8_8),
                   .in_0(abort8_8),
                   .in_1(I_prime),
                   .in_2(cl8),
                   .in_3(reset_prime),
                   .out_hi_0(t_8_10),
                   .out_hi_1(t_8_9),
                   .out_hi_2(t_8_9),
                   .out_lo_3(t_6_8),
                   .out_hi_3(H));

  Relay relay_s9 (.control(t_8_9),
                   .in_0(t_8_9),
                   .in_1(J_prime),
                   .in_2(cl9),
                   .in_3(A_prime),
                   .out_hi_0(t_9_11),
                   .out_hi_1(t_9_10),
                   .out_hi_2(t_9_10),
                   .out_lo_3(t_7_9),
                   .out_hi_3(I));

  Relay relay_abort10 (.control(abort10),
                   .in_0(abort10),
                   .in_1(t_9_10),
                   .out_hi_0(pA_prime),
                   .out_hi_1(reset));

  Relay relay_s10 (.control(abort10_10),
                   .in_0(abort10_10),
                   .in_1(K_prime),
                   .in_2(cl10),
                   .in_3(reset_prime),
                   .out_hi_0(t_10_12),
                   .out_hi_1(t_10_11),
                   .out_hi_2(t_10_11),
                   .out_lo_3(t_8_10),
                   .out_hi_3(J));

  Relay relay_s11 (.control(t_10_11),
                   .in_0(t_10_11),
                   .in_1(L_prime),
                   .in_2(cl11),
                   .in_3(A_prime),
                   .out_hi_0(t_11_13),
                   .out_hi_1(t_11_12),
                   .out_hi_2(t_11_12),
                   .out_lo_3(t_9_11),
                   .out_hi_3(K));

  Relay relay_abort12 (.control(abort12),
                   .in_0(abort12),
                   .in_1(t_11_12),
                   .out_hi_0(pA_prime),
                   .out_hi_1(reset));

  Relay relay_s12 (.control(abort12_12),
                   .in_0(abort12_12),
                   .in_1(M_prime),
                   .in_2(cl12),
                   .in_3(reset_prime),
                   .out_hi_0(t_12_14),
                   .out_hi_1(t_12_13),
                   .out_hi_2(t_12_13),
                   .out_lo_3(t_10_12),
                   .out_hi_3(L));

  Relay relay_s13 (.control(t_12_13),
                   .in_0(t_12_13),
                   .in_1(N_prime),
                   .in_2(cl13),
                   .in_3(A_prime),
                   .out_hi_0(t_13_15),
                   .out_hi_1(t_13_14),
                   .out_hi_2(t_13_14),
                   .out_lo_3(t_11_13),
                   .out_hi_3(M));

  Relay relay_abort14 (.control(abort14),
                   .in_0(abort14),
                   .in_1(t_13_14),
                   .out_hi_0(pA_prime),
                   .out_hi_1(reset));

  Relay relay_s14 (.control(abort14_14),
                   .in_0(abort14_14),
                   .in_1(O_prime),
                   .in_2(cl14),
                   .in_3(reset_prime),
                   .out_hi_0(t_14_16),
                   .out_hi_1(t_14_15),
                   .out_hi_2(t_14_15),
                   .out_lo_3(t_12_14),
                   .out_hi_3(N));

  Relay relay_s15 (.control(t_14_15),
                   .in_0(t_14_15),
                   .in_1(P_prime),
                   .in_2(cl15),
                   .in_3(A_prime),
                   .out_hi_0(t_15_17),
                   .out_hi_1(t_15_16),
                   .out_hi_2(t_15_16),
                   .out_lo_3(t_13_15),
                   .out_hi_3(O));

  Relay relay_s16 (.control(t_15_16),
                   .in_0(t_15_16),
                   .in_1(Q_prime),
                   .in_2(cl16),
                   .in_3(V),
                   .out_hi_0(t_16_18),
                   .out_hi_1(t_16_17),
                   .out_hi_2(t_16_17),
                   .out_lo_3(t_14_16),
                   .out_hi_3(P));

  Relay relay_s17 (.control(t_16_17),
                   .in_0(t_16_17),
                   .in_1(R_prime),
                   .in_2(cl17),
                   .in_3(V),
                   .out_hi_0(t_17_19),
                   .out_hi_1(t_17_18),
                   .out_hi_2(t_17_18),
                   .out_lo_3(t_15_17),
                   .out_hi_3(Q));

  Relay relay_s18 (.control(t_17_18),
                   .in_0(t_17_18),
                   .in_1(S_prime),
                   .in_2(cl18),
                   .in_3(V),
                   .out_hi_0(t_18_20),
                   .out_hi_1(t_18_19),
                   .out_hi_2(t_18_19),
                   .out_lo_3(t_16_18),
                   .out_hi_3(R));

  Relay relay_s19 (.control(t_18_19),
                   .in_0(t_18_19),
                   .in_1(T_prime),
                   .in_2(cl19),
                   .in_3(V),
                   .out_hi_0(t_19_21),
                   .out_hi_1(t_19_20),
                   .out_hi_2(t_19_20),
                   .out_lo_3(t_17_19),
                   .out_hi_3(S));

  Relay relay_s20 (.control(t_19_20),
                   .in_0(t_19_20),
                   .in_1(U_prime),
                   .in_2(cl20),
                   .in_3(V),
                   .out_hi_0(t_20_22),
                   .out_hi_1(t_20_21),
                   .out_hi_2(t_20_21),
                   .out_lo_3(t_18_20),
                   .out_hi_3(T));

  Relay relay_s21 (.control(t_20_21),
                   .in_0(t_21_23),
                   .in_1(V_prime),
                   .in_2(cl21),
                   .in_3(V),
                   .out_hi_0(t_21_23),
                   .out_hi_1(t_21_22),
                   .out_hi_2(t_21_22),
                   .out_lo_3(t_19_21),
                   .out_hi_3(U));

  Relay relay_s22 (.control(t_21_22),
                   .in_0(t_21_22),
                   .in_1(W_prime),
                   .in_2(cl22),
                   .in_3(V),
                   .out_hi_0(t_22_rst),
                   .out_hi_1(t_22_23),
                   .out_hi_2(t_22_23),
                   .out_lo_3(t_20_22),
                   .out_hi_3(V));

  Relay relay_s23 (.control(t_22_23),
                   .in_0(t_22_23),
                   .in_2(cl23),
                   .in_3(V),
                   .out_hi_1(reset),
                   .out_lo_3(t_21_23),
                   .out_hi_3(W));

  always @(negedge clock) begin
    fsm_out_var = {W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A};
  end

endmodule

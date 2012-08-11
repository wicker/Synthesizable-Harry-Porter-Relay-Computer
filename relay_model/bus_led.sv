/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: LED bus - shows outputs
 * License: MIT http://opensource.org/licenses/MIT
*/

interface led_bus();

  parameter LED_BUS_WIDTH = 26;

  assign inst0_led = inst0;
  assign inst1_led = inst1;
  assign inst2_led = inst2;
  assign inst3_led = inst3;
  assign inst4_led = inst4;
  assign inst5_led = inst5;
  assign inst6_led = inst6;
  assign inst7_led = inst7;

  assign pA_led = pA;
  assign pB_led = pB;
  assign pC_led = pC;
  assign pD_led = pD;
  assign pE_led = pE;
  assign pF_led = pF;
  assign pG_led = pG;
  assign pH_led = pH;
  assign pI_led = pI;
  assign pJ_led = pJ;
  assign pK_led = pK;
  assign pL_led = pL;
  assign pM_led = pM;
  assign pN_led = pN;
  assign pO_led = pO;  // he skips P
  assign pQ_led = pQ;
  assign pR_led = pR;
  assign pS_led = pS;
  assign pT_led = pT;

  assign ld_Y_led = ld_Y;
  assign ld_X_led = ld_X;
  assign ld_M2_led = ld_M2;
  assign ld_M1_led = ld_M1;
  assign ld_D_led = ld_D;
  assign ld_C_led = ld_C;
  assign ld_B_led = ld_B;
  assign ld_A_led = ld_A;
  assign ld_XY_led = ld_XY;
  assign ld_COND_led = ld_COND;
  assign bus_to_mem_led = bus_to_mem;
  assign mem_write_led = mem_write;
  assign mem_read_led = mem_read;
  assign ld_J1_led = ld_J1;
  assign ld_J2_led = ld_J2;
  assign sel_J_led = sel_J;
  assign ld_INST_led = ld_INST;
  assign ld_PC_led = ld_PC;
  assign sel_PC_led = sel_PC;
  assign sel_INC_led = sel_INC;
  assign ld_INC_led = ld_INC;
  assign f1_led = f1;
  assign f2_led = f2;
  assign f3_led = f3;
  assign sel_M_led = sel_M;
  assign sel_XY_led = sel_XY;
  assign sel_A_led = sel_A;
  assign sel_B_led = sel_B;
  assign sel_C_led = sel_C;
  assign sel_D_led = sel_D;
  assign sel_M1_led = sel_M1;
  assign sel_M2_led = sel_M2;
  assign sel_X_led = sel_X;
  assign sel_Y_led = sel_X;
  
  modport reg_A     (output wire load, sel);  

  modport reg_B     (output wire load, sel);

  modport reg_C     (output wire load, sel);

  modport reg_D     (output wire load, sel);

  modport reg_M1    (output wire load, sel);

  modport reg_M2    (output wire load, sel);  

  modport reg_M     (output wire load, sel);
 
  modport reg_X     (output wire load, sel);
 
  modport reg_Y     (output wire load, sel);

  modport reg_XY    (output wire load, sel);

  modport reg_J1    (output wire load, sel);

  modport reg_J2    (output wire load, sel);

  modport reg_J     (output wire load, sel);

  modport reg_INST  (output wire load, sel);

  modport reg_PC    (output wire load, sel);

  modport reg_INC   (output wire load, sel);

endinterface

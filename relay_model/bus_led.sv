/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: LED bus - shows outputs
 * License: MIT http://opensource.org/licenses/MIT
*/

interface led_bus();

  assign inst0_led = inst_out[0];
  assign inst1_led = inst_out[1];
  assign inst2_led = inst_out[2];
  assign inst3_led = inst_out[3];
  assign inst4_led = inst_out[4];
  assign inst5_led = inst_out[5];
  assign inst6_led = inst_out[6];
  assign inst7_led = inst_out[7];

  assign pA_led = fsm_out[18];
  assign pB_led = fsm_out[17];
  assign pC_led = fsm_out[16];
  assign pD_led = fsm_out[15];
  assign pE_led = fsm_out[14];
  assign pF_led = fsm_out[13];
  assign pG_led = fsm_out[12];
  assign pH_led = fsm_out[11];
  assign pI_led = fsm_out[10];
  assign pJ_led = fsm_out[9];
  assign pK_led = fsm_out[8];
  assign pL_led = fsm_out[7];
  assign pM_led = fsm_out[6];
  assign pN_led = fsm_out[5];
  assign pO_led = fsm_out[4];  // he skips P
  assign pQ_led = fsm_out[3];
  assign pR_led = fsm_out[2];
  assign pS_led = fsm_out[1];
  assign pT_led = fsm_out[0];

  assign ld_Y_led = reg_Y.load;
  assign ld_X_led = reg_X.load;
  assign ld_M2_led = reg_M2.load;
  assign ld_M1_led = reg_M1.load;
  assign ld_D_led = reg_D.load;
  assign ld_C_led = reg_C.load;
  assign ld_B_led = reg_B.load;
  assign ld_A_led = reg_A.load;
  assign ld_XY_led = reg_XY.load;
  assign ld_CCR_led = reg_CCR.load;
  assign bus_to_mem_led = memory.bus_to_mem;
  assign mem_write_led = memory.mem_write;
  assign mem_read_led = memory.mem_read;
  assign ld_J1_led = reg_J1.load;
  assign ld_J2_led = reg_J2.load;
  assign sel_J_led = reg_J2.sel;
  assign ld_INST_led = reg_INST.load;
  assign ld_PC_led = reg_PC.load;
  assign sel_PC_led = reg_PC.sel;
  assign sel_INC_led = reg_INC.sel;
  assign ld_INC_led = reg_INC.load;
  assign f1_led = alu.f1;
  assign f2_led = alu.f2;
  assign f3_led = alu.f3;
  assign sel_M_led = reg_M.sel;
  assign sel_XY_led = reg_XY.sel;
  assign sel_A_led = reg_A.sel;
  assign sel_B_led = reg_B.sel;
  assign sel_C_led = reg_C.sel;
  assign sel_D_led = reg_D.sel;
  assign sel_M1_led = reg_M1.sel;
  assign sel_M2_led = reg_M2.sel;
  assign sel_X_led = reg_X.sel;
  assign sel_Y_led = reg_Y.sel;
  
  modport sequencer (input wire fsm_out);

  modport reg_A     (input wire load, sel);  

  modport reg_B     (input wire load, sel);

  modport reg_C     (input wire load, sel);

  modport reg_D     (input wire load, sel);

  modport reg_M1    (input wire load, sel);

  modport reg_M2    (input wire load, sel);  

  modport reg_M     (input wire load, sel);
 
  modport reg_X     (input wire load, sel);
 
  modport reg_Y     (input wire load, sel);

  modport reg_XY    (input wire load, sel);

  modport reg_J1    (input wire load, sel);

  modport reg_J2    (input wire load, sel);

  modport reg_J     (input wire load, sel);

  modport reg_INST  (input wire [7:0] inst_out, load, sel);

  modport reg_PC    (input wire load, sel);

  modport reg_INC   (input wire load, sel);

  modport alu       (input wire f1, f2, f3);

  modport reg_CCR   (input wire ccr_out);

  modport memory    (input wire bus_to_mem, mem_read, mem_write);

endinterface

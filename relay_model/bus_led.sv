/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: LED bus - shows outputs
 * License: MIT http://opensource.org/licenses/MIT
*/

interface LED_Bus();

  wire inst0_led, inst1_led, inst2_led, inst3_led,
       inst4_led, inst5_led, inst6_led, inst7_led;

  wire [18:0] fsm_out;
  wire [7:0] inst_out;

  assign fsm_out_var = fsm_out;

  wire pA_led, pB_led, pC_led, pD_led, pE_led, pF_led, pG_led,
       pH_led, pI_led, pJ_led, pK_led, pL_led, pM_led, pN_led,
       pO_led, pQ_led, pR_led, pS_led, pT_led;

  wire ldY, ldX, ldM, ldM2, ldM1, ldD, ldC,ldB, ldA, ldXY, 
       ldCCR, ldJ1, ldJ2, ldINST, ldPC, ldINC, ldINC16 ,
       selPC, selJ, selINC, selM, selXY, selA, selB, 
       selC, selD, selM1, selM2, selX, selY;

  wire bus_to_mem, mem_write, mem_read; 

  wire fctn_code;

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

  modport reg_A (output ldA, selA);

  modport reg_B (output ldB, selB);

  modport reg_C (output ldC, selC);

  modport reg_D (output ldD, selD);

  modport reg_INST (output ldINST, inst_out);

  modport reg_M1 (output ldM1, selM1);

  modport reg_M2 (output ldM2, selM2);

  modport reg_M (output ldM, selM);

  modport reg_X (output ldX, selX);

  modport reg_Y (output ldY, selY);

  modport reg_XY (output ldXY, selXY);

  modport reg_J1 (output ldJ1);

  modport reg_J2 (output ldJ2);

  modport reg_J (output selJ);

  modport reg_PC (output ldPC, selPC);

  modport reg_INC (output ldINC, selINC);

  modport INC16 (output ldINC16);

  modport reg_CCR (output ldCCR);

  modport alu (output fctn_code);

  modport memory (output mem_read, mem_write);

  modport decoder (output pA_led,pB_led,pC_led,pD_led,pE_led,pF_led,pG_led,pH_led,pI_led,pJ_led,pK_led,pL_led,pM_led,pN_led,pO_led,pQ_led,pR_led,pS_led,pT_led);
 
endinterface

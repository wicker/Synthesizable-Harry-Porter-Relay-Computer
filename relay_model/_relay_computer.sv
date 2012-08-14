/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Top-level Relay Computer Module
 * License: MIT http://opensource.org/licenses/MIT
*/

`include "arith_logic_unit/3to8.sv"
`include "arith_logic_unit/adder_block.sv"
`include "arith_logic_unit/adder_unit.sv"
`include "arith_logic_unit/alu.sv"
`include "arith_logic_unit/logic_unit.sv"
`include "arith_logic_unit/shleft.sv"
`include "arith_logic_unit/zero_detect.sv"
`include "bus_ctrl.sv"
`include "bus_addr.sv"
`include "bus_led.sv"
`include "bus_data.sv"
`include "enable.sv"
`include "program_control_unit/sixteen-increment.sv"
`include "register_unit/reg_A.sv"
`include "register_unit/reg_B.sv"
`include "register_unit/reg_C.sv"
`include "register_unit/reg_D.sv"
`include "register_unit/reg_M1.sv"
`include "register_unit/reg_M2.sv"
`include "register_unit/reg_M.sv"
`include "register_unit/reg_J1.sv"
`include "register_unit/reg_J2.sv"
`include "register_unit/reg_J.sv"
`include "register_unit/reg_X.sv"
`include "register_unit/reg_Y.sv"
`include "register_unit/reg_XY.sv"
`include "register_unit/reg_PC.sv"
`include "register_unit/reg_INC.sv"
`include "register_unit/reg_INST.sv"
`include "register_unit/eight_bit_register.sv" 
`include "register_unit/sixteen_bit_register.sv"
`include "register_unit/three_bit_register.sv"
`include "sequencer_unit/fsa.sv"
`include "sequencer_unit/instruction_decoder.sv"
`include "memory.sv"
`include "register_unit/reg_CCR.sv"
 
module RelayComputer (input logic clock, V);

  // 
  // Clock Block 
  // 

  

  // 
  // Interfaces
  //

  Ctrl_Bus control   ();

  Data_Bus Data_Bus  ();

  Addr_Bus Addr_Bus  ();

  LED_Bus led        ();

  //
  // Register Unit
  //

  Reg_A reg_A          (Ctrl_Bus.reg_A,
                        Data_Bus.reg_A, LED_Bus.reg_A, alu_result);

  Reg_B reg_B          (Ctrl_Bus.reg_B,
                        Data_Bus.reg_B,
                        LED_Bus.reg_B,
                        b);

  Reg_C reg_C          (Ctrl_Bus.reg_C,
                        Data_Bus.reg_C,
                        LED_Bus.reg_C,
                        c);

  Reg_D reg_D          (Ctrl_Bus.reg_D,
                        Data_Bus.reg_D,
                        LED_Bus.reg_D,
                        alu_result);

  Reg_M1 reg_M1      (Ctrl_Bus.reg_M1,
                        LED_Bus.reg_M1,
                        Data_Bus.reg_M1,
                        M1_content);

  Reg_M2 reg_M2      (Ctrl_Bus.reg_M2,
                        LED_Bus.reg_M2,
                        Data_Bus.reg_M2,
                        M2_content);

  Reg_M reg_M       (Ctrl_Bus.reg_M,
                        LED_Bus.reg_M,
                        Addr_Bus.reg_M,
                        M1_content, M2_content);

  Reg_X reg_X       (Ctrl_Bus.reg_X,
                        LED_Bus.reg_X,
                        Data_Bus.reg_X,
                        X_content);

  Reg_Y reg_Y       (Ctrl_Bus.reg_Y,
                        LED_Bus.reg_Y,
                        Data_Bus.reg_Y,
                        Y_content);

  Reg_XY reg_XY      (Ctrl_Bus.reg_XY,
                        LED_Bus.reg_XY,
                        Addr_Bus.reg_XY,
                        X_content, Y_content);

  //
  // Program Control Unit
  //

  Reg_J1 reg_J1    (Ctrl_Bus.reg_J1,
                      LED_Bus.reg_J1,
                      Data_Bus.reg_J1,
                      J1_reg);

  Reg_J2 reg_J2    (Ctrl_Bus.reg_J1,
                      LED_Bus.reg_J2,
                      Data_Bus.reg_J2,
                      J2_reg);

  Reg_J reg_J     (Ctrl_Bus.reg_J,
                      LED_Bus.reg_J,
                      Addr_Bus.reg_J,
                      J_reg);

  Reg_INST reg_INST  (Ctrl_Bus.reg_INST,
                      LED_Bus.reg_INST,
                      Data_Bus.reg_INST,
                      inst_out);

  Reg_PC reg_PC    (Ctrl_Bus.reg_PC,
                      LED_Bus.reg_PC,
                      Addr_Bus.reg_PC);

  Reg_CCR reg_CCR    (zero, carry, sign, ccr_out);

  Reg_INC reg_INC (Ctrl_Bus.reg_INC,
                          LED_Bus.reg_INC,
                          Addr_Bus.reg_INC,
                          inc_result);

  SixteenBitInc INC16 (Addr_Bus.INC16,
                        LED_Bus.INC16,
                        inc_result);
  //
  // ALU 
  //

  ALU alu (LED_Bus.alu, Data_Bus.alu);

  //
  // Sequencer Unit
  //

  FSA sequencer (LED_Bus.sequencer, clock, V, reset, fsm_out);

  InstructionDecoder decoder (fsm_out, ccr_out, inst_out, Ctrl_Bus.decoder, LED_Bus.decoder);

  Memory mem_unit (Addr_Bus.memory, data_bus.memory, LED_Bus.memory);

endmodule

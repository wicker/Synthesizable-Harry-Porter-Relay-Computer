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
 
module RelayComputer (input logic clock, V, [14:0][7:0] initial_memory, loadMem, loadMemComplete);

  wire [7:0] alu_result, b, c, inst_out,  
       M1_content, M2_content, J1_content, J2_content, X_content, Y_content;

  wire [23:0] fsm_out, fsm_out_prime;

  wire carry, zero;

  wire [15:0] inc_result, J_content, M_content, XY_content; 

  // 
  // Interfaces
  //

  Ctrl_Bus control   ();

  Data_Bus data_bus  ();

  Addr_Bus addr_bus  ();

  LED_Bus led        ();

  //
  // Register Unit
  //

  Reg_A reg_A          (control.reg_A,
                        data_bus.reg_A, 
                        led.reg_A,
                        alu_result);

  Reg_B reg_B          (control.reg_B,
                        data_bus.reg_B,
                        led.reg_B,
                        b);

  Reg_C reg_C          (control.reg_C,
                        data_bus.reg_C,
                        led.reg_C,
                        c);

  Reg_D reg_D          (control.reg_D,
                        data_bus.reg_D,
                        led.reg_D,
                        alu_result);

  Reg_M1 reg_M1      (control.reg_M1,
                        led.reg_M1,
                        data_bus.reg_M1,
                        M1_content);

  Reg_M2 reg_M2      (control.reg_M2,
                        led.reg_M2,
                        data_bus.reg_M2,
                        M2_content);

  Reg_M reg_M       (control.reg_M,
                        led.reg_M,
                        addr_bus.reg_M,
                        M1_content, M2_content);

  Reg_X reg_X       (control.reg_X,
                        led.reg_X,
                        data_bus.reg_X,
                        X_content);

  Reg_Y reg_Y       (control.reg_Y,
                        led.reg_Y,
                        data_bus.reg_Y,
                        Y_content);

  Reg_XY reg_XY      (control.reg_XY,
                        led.reg_XY,
                        addr_bus.reg_XY,
                        X_content, Y_content);

  //
  // Program Control Unit
  //

  Reg_J1 reg_J1    (control.reg_J1,
                      led.reg_J1,
                      data_bus.reg_J1,
                      J1_content);

  Reg_J2 reg_J2    (control.reg_J1,
                      led.reg_J2,
                      data_bus.reg_J2,
                      J2_content);

  Reg_J reg_J     (control.reg_J,
                      led.reg_J,
                      addr_bus.reg_J,
                      J1_content,
                      J2_content);

  Reg_INST reg_INST  (control.reg_INST,
                      led.reg_INST,
                      data_bus.reg_INST,
                      inst_out);

  Reg_PC reg_PC    (control.reg_PC,
                      led.reg_PC,
                      addr_bus.reg_PC);

  Reg_CCR reg_CCR    (data_bus.reg_CCR, 
                      control.reg_CCR, 
                      led.reg_CCR,
                      carry, zero, ccr_out);

  Reg_INC reg_INC (control.reg_INC,
                          led.reg_INC,
                          addr_bus.reg_INC,
                          inc_result);

  SixteenBitInc INC16 (addr_bus.INC16,
                       led.INC16,
                       inc_result);
  //
  // ALU 
  //

  ALU alu (V, b, c, fctn_code, zero, carry, alu_result, led.alu);

  //
  // Sequencer Unit
  //

  FSA sequencer (clock, V, reset, fsm_out, fsm_out_prime);

  InstructionDecoder decoder (control.decoder, led.decoder, inst_reg, fsa_out, fsa_out_prime, ccr);

  Memory memory (initial_memory, loadMem, control.memory, data_bus.memory, addr_bus.memory, led.memory, loadMemComplete);

endmodule

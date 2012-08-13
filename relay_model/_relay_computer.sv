/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Top-level Relay Computer Module
 * License: MIT http://opensource.org/licenses/MIT
*/

module RelayComputer (clock, V);

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

  Reg_ALU_Result reg_A (input wire logic [7:0] alu_result,
                        ctrl_bus.ldA, ctrl_bus.selA,
                        data_bus.data, led_bus.ldA, led_bus.selA);

  Reg_ALU_BC reg_B     (ctrl_bus.reg_B,
                        data_bus.reg_B,
                        led_bus.reg_B,
                        output wire logic [7:0] b);

  Reg_ALU_BC reg_C     (ctrl_bus.reg_C,
                        data_bus.reg_C,
                        led_bus.reg_C,
                        output wire logic [7:0] c);

  Reg_ALU_Result reg_D (ctrl_bus.reg_D,
                        data_bus.reg_D,
                        led_bus.reg_D,
                        input wire logic [7:0] alu_result);

  Reg_Data reg_M1      (ctrl_bus.reg_M1,
                        led_bus.reg_M1,
                        data_bus.reg_M1,
                        output wire logic M1_reg);

  Reg_Data reg_M2      (ctrl_bus.reg_M2,
                        led_bus.reg_M2
                        data_bus.reg_M2,
                        output wire logic M2_reg);

  Reg_Addr reg_M       (ctrl_bus.reg_M,
                        led_bus.reg_M,
                        addr_bus.reg_M,
                        input wire logic M1_reg, M2_reg);

  Reg_Data reg_X       (ctrl_bus.reg_X,
                        led_bus.reg_X,
                        data_bus.reg_X,
                        output wire logic X_reg);

  Reg_Data reg_Y       (ctrl_bus.reg_Y,
                        led_bus.reg_Y,
                        data_bus.reg_Y,
                        output wire logic Y_reg);

  Reg_Addr reg_XY      (ctrl_bus.reg_XY,
                        led_bus.reg_XY,
                        addr_bus.reg_XY,
                        input wire logic X_reg, Y_reg);

  //
  // Program Control Unit
  //

  Reg_Data reg_J1    (ctrl_bus.reg_J1,
                      led_bus.reg_J1,
                      data_bus.reg_J1,
                      output wire logic J1_reg);

  Reg_Data reg_J2    (ctrl_bus.reg_J1,
                      led_bus.reg_J2,
                      data_bus.reg_J2,
                      output wire logic J2_reg);

  Reg_Addr reg_J     (ctrl_bus.reg_J,
                      led_bus.reg_J,
                      addr_bus.reg_J,
                      input wire logic J_reg);

  Reg_Data reg_INST  (ctrl_bus.reg_INST,
                      led_bus.reg_INST,
                      data_bus.reg_INST,
                      inst_out);

  Reg_Addr reg_PC    (ctrl_bus.reg_PC,
                      led_bus.reg_PC,
                      addr_bus.reg_PC);

  Reg_CCR reg_CCR    (zero, carry, sign, ccr_out);

  Reg_INC_Result reg_INC (ctrl_bus.reg_INC,
                          led_bus.reg_INC,
                          addr_bus.reg_INC,
                          input wire logic [15:0] inc_result);

  SixteenBitInc 16_INC (addr_bus.16_INC,
                        led_bus.reg_16_INC,
                        output wire logic [15:0] inc_result);
  //
  // ALU 
  //

  ALU alu (led_bus.alu, data_bus.alu);

  //
  // Sequencer Unit
  //

  FSA sequencer (led_bus.sequencer, clock, V, reset, fsm_out);

  InstructionDecoder decoder (fsm_out, ccr_out, inst_out, ctrl_bus.decoder, led_bus.decoder);

  Memory mem_unit (addr_bus.memory, data_bus.memory, led_bus.memory);


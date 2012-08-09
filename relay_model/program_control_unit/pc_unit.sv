/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Program Control Unit
 * This file holds reg J1, J2, J, INST, PC, INC
 * These registers and incrementer live in the same space as alu and reg_unit
 * License: MIT http://opensource.org/licenses/MIT
*/

  Reg_Data reg_J1    (ctrl_bus.reg_J1,
                      data_bus.reg_J1);

  Reg_Data reg_J2    (ctrl_bus.reg_J1,
                      data_bus.reg_J2);

  Reg_Addr reg_J     (ctrl_bus.reg_J,
                      addr_bus.reg_J);

  Reg_Data reg_INST  (ctrl_bus.reg_INST,
                      data_bus.reg_INST);

  Reg_Addr reg_PC    (ctrl_bus.reg_PC,
                      addr_bus.reg_PC);

  Reg_INC_Result reg_INC (ctrl_bus.reg_INC,
                          addr_bus.reg_INC,
                          input wire logic [15:0] inc_result);

  SixteenBitInc 16_INC (addr_bus.16_INC,
                        output wire logic [15:0] inc_result);


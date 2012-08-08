/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Program Control Unit
 * This module just holds the eight-bit registers.
 * It is entirely structural and passes no signals.
 * License: MIT http://opensource.org/licenses/MIT
*/

module program_control_unit();

  EightBitRegister reg_J1    (ctrl_bus.reg_J1,
                              data_bus.reg_J1);

  EightBitRegister reg_J2    (ctrl_bus.reg_J1,
                              data_bus.reg_J2);

  SixteenBitRegister reg_J     (ctrl_bus.reg_J,
                               addr_bus.reg_J);

  EightBitRegister reg_INST    (ctrl_bus.reg_INST,
                               data_bus.reg_INST);

  SixteenBitRegister reg_PC    (ctrl_bus.reg_PC,
                               addr_bus.reg_PC);

  SixteenBitRegister reg_INC   (ctrl_bus.reg_INC,
                               addr_bus.reg_INC);

  SixteenBitRegister reg_16INC (addr_bus.reg_16INC);

endmodule

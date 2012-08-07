/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Program Control Unit
 * This module just holds the eight-bit registers.
 * It is entirely structural and passes no signals.
 * License: MIT http://opensource.org/licenses/MIT
*/

module program_control_unit();

  EightBitRegister reg_J     (ctrl_bus.reg_J,
                              data_bus.reg_J,
                              addr_bus.reg_J);

  EightBitRegister reg_INST  (ctrl_bus.reg_INST,
                              data_bus.reg_INST);

  EightBitRegister reg_PC    (ctrl_bus.reg_PC,
                              addr_bus.reg_PC);

  EightBitRegister reg_INC   (ctrl_bus.reg_INC,
                              addr_bus.reg_INC);

  EightBitRegister reg_16INC (addr_bus.reg_16INC);

endmodule

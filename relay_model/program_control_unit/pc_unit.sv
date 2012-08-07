/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Program Control Unit
 * This module just holds the eight-bit registers.
 * It is entirely structural and passes no signals.
 * License: MIT http://opensource.org/licenses/MIT
*/

module program_control_unit();

  EightBitRegister reg_J     (ctrl_bus ctrl_bus,
                              data_bus data_bus,
                              addr_bus addr_bus);

  EightBitRegister reg_INST  (ctrl_bus ctrl_bus,
                              data_bus data_bus);

  EightBitRegister reg_PC    (ctrl_bus ctrl_bus,
                              addr_bus addr_bus);

  EightBitRegister reg_INC   (ctrl_bus ctrl_bus,
                              addr_bus addr_bus);

  EightBitRegister reg_16INC (addr_bus addr_bus);

endmodule

/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register unit
 * This module just holds the eight-bit registers.
 * It is entirely structural and passes no signals. 
 * License: MIT http://opensource.org/licenses/MIT
*/

module register_unit ();

  EightBitRegister reg_A     (ctrl_bus ctrl_bus,
                              data_bus data_bus); 

  EightBitRegister reg_B     (ctrl_bus ctrl_bus,
                              data_bus data_bus); 
 
  EightBitRegister reg_C     (ctrl_bus ctrl_bus,
                              data_bus data_bus);

  EightBitRegister reg_D     (ctrl_bus ctrl_bus,
                              data_bus data_bus);

  EightBitRegister reg_M     (ctrl_bus ctrl_bus,
                              data_bus data_bus,
                              addr_bus addr_bus);

  EightBitRegister reg_XY    (ctrl_bus ctrl_bus,
                              data_bus data_bus,
                              addr_bus addr_bus);
endmodule

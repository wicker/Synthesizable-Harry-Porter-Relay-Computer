/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register unit 
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

  EightBitRegister reg_ALU   (ctrl_bus ctrl_bus,
                              data_bus data_bus);

endmodule

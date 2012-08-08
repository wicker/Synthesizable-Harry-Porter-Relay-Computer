/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register unit
 * This module just holds the eight-bit registers.
 * It is entirely structural and passes no signals. 
 * License: MIT http://opensource.org/licenses/MIT
*/

module register_unit ();

  EightBitRegister reg_A     (ctrl_bus.reg_A,
                              data_bus.reg_A,
                              input wire logic [7:0] alu_result); 

  EightBitRegister reg_B     (ctrl_bus.reg_B,
                              data_bus.reg_B,
                              output wire logic [7:0] b); 
 
  EightBitRegister reg_C     (ctrl_bus.reg_C,
                              data_bus.reg_C,
                              output wire logic [7:0] c);

  EightBitRegister reg_D     (ctrl_bus.reg_D,
                              data_bus.reg_D,
                              input wire logic [7:0] alu_result); 

  EightBitRegister reg_M1    (ctrl_bus.reg_M1,
                              data_bus.reg_M1);

  EightBitRegister reg_M2    (ctrl_bus.reg_M2,
                              data_bus.reg_M2);

  SixteenBitRegister reg_M   (ctrl_bus.reg_M,
                              addr_bus.reg_M);

  EightBitRegister reg_X     (ctrl_bus.reg_X,
                              data_bus.reg_X);

  EightBitRegister reg_Y     (ctrl_bus.reg_Y,
                              data_bus.reg_Y);

  SixteenBitRegister reg_XY   (ctrl_bus.reg_XY,
                              addr_bus.reg_XY);

endmodule

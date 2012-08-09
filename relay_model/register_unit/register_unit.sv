/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register unit
 * This module holds reg A, B, C, D, M1, M2, M, X, Y, XY
 * It is entirely structural and passes no signals. 
 * License: MIT http://opensource.org/licenses/MIT
*/

module register_unit ();

  Reg_ALU_Result reg_A (ctrl_bus.reg_A,
                        data_bus.reg_A,
                        input wire logic [7:0] alu_result); 

  Reg_ALU_BC reg_B     (ctrl_bus.reg_B,
                        data_bus.reg_B,
                        output wire logic [7:0] b); 
 
  Reg_ALU_BC reg_C     (ctrl_bus.reg_C,
                        data_bus.reg_C,
                        output wire logic [7:0] c);

  Reg_ALU_Result reg_D (ctrl_bus.reg_D,
                        data_bus.reg_D,
                        input wire logic [7:0] alu_result); 

  Reg_Data reg_M1      (ctrl_bus.reg_M1,
                        data_bus.reg_M1);

  Reg_Data reg_M2      (ctrl_bus.reg_M2,
                        data_bus.reg_M2);

  Reg_Addr reg_M       (ctrl_bus.reg_M,
                        addr_bus.reg_M);

  Reg_Data reg_X       (ctrl_bus.reg_X,
                        data_bus.reg_X);

  Reg_Data reg_Y       (ctrl_bus.reg_Y,
                        data_bus.reg_Y);

  Reg_Addr reg_XY      (ctrl_bus.reg_XY,
                        addr_bus.reg_XY);

endmodule

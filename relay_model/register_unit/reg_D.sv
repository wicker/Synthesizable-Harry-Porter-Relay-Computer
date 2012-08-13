/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for D 
 * Data bus output, ctrl bus in, alu_result in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_D (input logic [8-1:0] alu_result, 
              Ctrl_Bus control,
              LED_Bus led,
              Data_Bus data_bus);

  parameter N = 8;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldD;
  assign sel = control.selD;

  assign led.ldD = load;
  assign led.selD = sel;

  always begin
    if (load)
     content = alu_result;
    else if (sel) 
     data_bus.data = content;
  end

  nBitRegister nBitsRegD (N, load, sel, content);

endmodule

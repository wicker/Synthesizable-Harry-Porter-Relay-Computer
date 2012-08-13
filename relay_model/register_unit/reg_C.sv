/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for C 
 * Data bus input, ctrl bus in, alu_result out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_C (Ctrl_Bus control,
              LED_Bus led,
              Data_Bus data_bus);

  parameter N = 8;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldC;
  assign sel = control.selC;

  assign led.ldC = load;
  assign led.selC = sel;

  always begin
    if (load)
      content = data_bus.data;
    else if (sel) 
      alu_input = content;
  end

  nBitRegister nBitsRegC (N, load, sel, content);

endmodule

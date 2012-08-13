/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for B 
 * Data bus input, ctrl bus in, alu_result out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_B (Ctrl_Bus control,
                   LED_Bus led,
                   Data_Bus data_bus);

  parameter N = 8;

  wire logic [N-1:0] content;

  assign load = control.ldB;
  assign sel = control.selB;

  assign led.load_led = load;
  assign led.sel = sel;

  if (load)
     content = data_bus.data;
  else if (sel) 
     alu_input = content;

  nBitRegister nBitsRegB (N, load, sel, content);

endmodule

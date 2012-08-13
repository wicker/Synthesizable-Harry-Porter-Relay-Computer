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

  wire logic [N-1:0] content;

  assign load = control.ldC;
  assign sel = control.selC;

  assign led.load_led = load;
  assign led.sel = sel;

  if (load)
     content = data_bus.data;
  else if (sel) 
     alu_input = content;

  nBitRegister nBitsRegC (N, load, sel, content);

endmodule

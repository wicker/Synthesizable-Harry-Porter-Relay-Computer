/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for C 
 * Data bus input, ctrl bus in, alu_result out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_C (Ctrl_Bus control,
              Data_Bus data_bus,
              LED_Bus led,
              output wire [7:0] c);

  parameter N = 8;

  logic [7:0] c_var;
  assign c = c_var;

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
      c_var = content;
  end

  EightBitRegister EightBitsRegB (load, sel, content);

endmodule

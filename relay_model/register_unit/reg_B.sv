/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for B 
 * Data bus input, ctrl bus in, alu_result out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_B (Ctrl_Bus control,
              LED_Bus led,
              Data_Bus data_bus,
              output wire [7:0] b);

  parameter N = 8;

  logic [7:0] b_var;
  assign b = b_var;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldB;
  assign sel = control.selB;

  assign led.ldB = load;
  assign led.selB = sel;

  always begin
    if (load)
      content = data_bus.data;
    else if (sel) 
      b_var = content;
  end

  nBitRegister nBitsRegB (N, load, sel, content);

endmodule

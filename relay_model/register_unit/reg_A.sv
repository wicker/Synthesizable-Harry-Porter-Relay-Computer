/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for A
 * Data bus output, ctrl bus in, alu_result in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_A (Ctrl_Bus control,
              Data_Bus data_bus,
              LED_Bus led,
              input logic [8-1:0] alu_result);

  parameter N = 8;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldA;
  assign sel = control.selA;

  assign led.ldA = load;
  assign led.selA = sel;

  always begin
    if (load)
      content = alu_result;
    else if (sel)
      data_bus.data = content;
  end

  EightBitRegister EightBitsRegA (load, sel, content);

endmodule

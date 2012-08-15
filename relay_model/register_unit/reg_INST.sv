/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in 
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_INST (Ctrl_Bus control, 
                 LED_Bus led, 
                 Data_Bus data_bus,
                 logic [7:0] inst_out);

  parameter N = 8;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldINST;

  assign led.ldINST = load;

  always begin
    if (load) 
      content = data_bus.data;
  end

  EightBitRegister EightBitsRegB (load, sel, content);

endmodule

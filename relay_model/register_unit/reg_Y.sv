/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, Y out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_Y (Ctrl_Bus control, 
               LED_Bus led, 
               Data_Bus data_bus,
               output logic [8-1:0] Y_content);

  parameter N = 8;

  logic load, sel;

  assign load = control.ldY;
  assign sel = control.selY;

  assign led.ldY = load;
  assign led.selY = sel;

  always begin
    if (load) 
      Y_content = data_bus.data;
    else if (sel)
      addr_bus.address = Y_content;
  end

  EightBitRegister EightBitsRegB (load, sel, Y_content);

endmodule

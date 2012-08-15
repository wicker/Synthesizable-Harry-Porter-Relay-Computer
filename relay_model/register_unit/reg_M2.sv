/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, J1 and J2 in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_M2 (Ctrl_Bus control, 
               LED_Bus led, 
               Data_Bus data_bus,
               output logic [8-1:0] M2_content);

  parameter N = 8;

  logic load, sel;

  assign load = control.ldM2;
  assign sel = control.selM2;

  assign led.ldM2 = load;
  assign led.selM2 = sel;

  always begin
    if (load) 
      M2_content = data_bus.data;
    else if (sel)
      data_bus.data = M2_content;
  end

  EightBitRegister EightBitsRegB (load, sel, content);

endmodule

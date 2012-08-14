/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, J1 and J2 in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_M1 (Ctrl_Bus control, 
               LED_Bus led, 
               Data_Bus data_bus,
               output logic [8-1:0] M1_content);

  parameter N = 8;

  logic load, sel;

  assign load = control.ldM1;
  assign sel = control.selM1;

  assign led.ldM1 = load;
  assign led.selM1 = sel;

  always begin
    if (load) 
      M1_content = data_bus.data;
    else if (sel)
      data_bus.address = M1_content;
  end

  EightBitRegister EightBitsRegB (load, sel, content);

endmodule

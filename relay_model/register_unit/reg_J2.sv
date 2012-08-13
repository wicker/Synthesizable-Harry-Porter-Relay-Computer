/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, J2 out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_J2 (Ctrl_Bus control, 
               LED_Bus led, 
               Data_Bus data_bus,
               output logic [8-1:0] J2_content);

  parameter N = 16;

  logic [N-1:0] J2_content;
  logic load, sel;

  assign load = control.ldJ2;
  assign sel = control.selJ2;

  assign led.ldJ2 = load;
  assign led.selJ2 = sel;

  always begin
    if (load) 
      J2_content = data.
    else if (sel)
      addr_bus.address = J2_content;
  end

  nBitRegister nBitsReg_J2 (N, load, sel, J2_content);

endmodule

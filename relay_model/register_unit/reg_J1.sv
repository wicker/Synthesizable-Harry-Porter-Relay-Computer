/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, J1 out 
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_J1 (Ctrl_Bus control, 
               LED_Bus led, 
               Data_Bus data_bus,
               output logic [8-1:0] J1_content);

  parameter N = 8;

  logic load, sel;

  assign load = control.ldJ1;

  assign led.ldJ1 = load;

  always begin
    if (load) 
      J1_content = data.
  end

  nBitRegister nBitsReg_J1 (N, load, sel, J1_content);

endmodule

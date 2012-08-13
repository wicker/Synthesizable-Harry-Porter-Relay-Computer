/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, X out
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_X (Ctrl_Bus control, 
               LED_Bus led, 
               Data_Bus data_bus,
               output logic [8-1:0] X_content);

  parameter N = 8;

  logic load, sel;

  assign load = control.ldX;
  assign sel = control.selX;

  assign led.ldX = load;
  assign led.selX = sel;

  always begin
    if (load) 
      X_content = data_bus.data;
    else if (sel)
      addr_bus.address = X_content;
  end

  nBitRegister nBitsReg_X (N, load, sel, X_content);

endmodule

/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, J1 and J2 in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_X (Ctrl_Bus control, 
               LED_Bus led, 
               Data_Bus data_bus,
               output logic [8-1:0] content);

  parameter N = 16;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldX;
  assign sel = control.selX;

  assign led.ldX = load;
  assign led.selX = sel;

  always begin
    if (load) 
      content = data_bus.data;
    else if (sel)
      addr_bus.address = content;
  end

  nBitRegister nBitsReg_X (N, load, sel, content);

endmodule

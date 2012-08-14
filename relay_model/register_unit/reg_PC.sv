/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_PC (Ctrl_Bus control,
               LED_Bus led, 
               Addr_Bus addr_bus);

  parameter N = 16;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.loadPC;
  assign sel = control.selPC;

  assign led.ldPC = load;
  assign led.selPC = sel;

  always begin
    if (load)
      content = addr_bus.address;
    else if (sel) 
      addr_bus.address = content;
  end

  nBitRegister nBitsReg_PC (N, load, sel, content);

endmodule

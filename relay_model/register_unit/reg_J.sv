/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, J1 and J2 in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_J (Ctrl_Bus control, 
              LED_Bus led, 
              Addr_Bus addr_bus,
              input logic [7:0] J1_content, J2_content);

  parameter N = 16;

  logic [N-1:0] content;
  logic load, sel;

  assign sel = control.selJ;

  assign led.selJ = sel;

  assign content = {J1_content,J2_content};

  always begin
    if (sel) 
      addr_bus.address = content;
    if (load)
      $warning("J already has continuous assign from J1 and J2");
  end

  SixteenBitRegister SixteenBitsRegB (load, sel, content);

endmodule

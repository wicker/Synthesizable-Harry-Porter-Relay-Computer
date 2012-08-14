/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, X and Y in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_XY (Ctrl_Bus control, 
               LED_Bus led, 
               Addr_Bus addr_bus,
               input logic [8-1:0] X_content, Y_content);

  parameter N = 16;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldXY;
  assign sel = control.selXY;

  assign led.ldXY = load;
  assign led.selXY = sel;

  assign content = {X_content,Y_content};

  always begin
    if (load) 
      $warning("XY already has continuous assign from X and Y");
    if (sel) 
      addr_bus.address = content;
  end

  SixteenBitRegister SixteenBitsRegB (load, sel, content);

endmodule

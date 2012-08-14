/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in, M1 and M2 in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_M (Ctrl_Bus control, 
              LED_Bus led, 
              Addr_Bus addr_bus,
              input logic [8-1:0] M1_content, M2_content);

  parameter N = 16;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.loadM;
  assign sel = control.selM;

  assign led.ldM = load;
  assign led.selM = sel;

  assign content = {M1_content,M2_content};

  always begin
    if (load)
      $warning("M already has continuous assign from M1 and M2");
    else if (sel) 
      addr_bus.address = content;
  end

  SixteenBitRegister SixteenBitsRegB (load, sel, content);

endmodule

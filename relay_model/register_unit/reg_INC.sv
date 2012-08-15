/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for address bus access
 * Address bus inout, ctrl bus in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_INC (Ctrl_Bus control, 
                LED_Bus led, 
                Addr_Bus addr_bus,
                input wire [16-1:0] INC16_out);

  parameter N = 16;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldINC;
  assign sel = control.selINC;

  assign led.ldINC = load;
  assign led.selINC = sel;

  always begin
    if (load)
      content = INC16_out;
    if (sel) 
      addr_bus.address = content;
  end

  SixteenBitRegister SixteenBitsRegB (load, sel, content);

endmodule

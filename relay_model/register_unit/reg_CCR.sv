/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for A
 * Data bus output, ctrl bus in, alu_result in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_CCR (Data_Bus data_bus,
                Ctrl_Bus control,
                LED_Bus led,
                input logic carry, zero,
                output wire ccr);

  parameter N = 3;

  logic [N-1:0] content;
  logic load, sel;

  assign load = control.ldCCR;

  assign led.ldCCR = load;

  assign ccr = content;

  always begin
    if (load)
     content = {carry, data_bus.data[7], zero};
  end

  ThreeBitRegister ThreeBitsCCR (load, sel, content);

endmodule

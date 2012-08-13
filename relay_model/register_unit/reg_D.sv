/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Register type for A and D
 * Data bus output, ctrl bus in, alu_result in
 * License: MIT http://opensource.org/licenses/MIT
*/

module Reg_ALU_Result (input logic [N-1:0] alu_result, 
                       input logic load, sel, 
                       output logic [N-1:0] data, 
                       output logic load_led, sel_led);

  parameter N = 8;

  wire logic [N-1:0] content;

  assign load_led = load;
  assign sel_led = sel;

  always begin
    if (load)
     content = alu_result;
    else if (sel) 
     data_bus.data = content;
  end

  nBitRegister NReg_AD (N, load, sel, content);

  always @(load || sel) begin
    printf("load: %b, sel: %b",load,sel);
  end

endmodule

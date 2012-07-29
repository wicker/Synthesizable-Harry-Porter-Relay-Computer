/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Shift Left unit testbench
 * License: MIT http://opensource.org/licenses/MIT
*/

module ShiftLeftTestBench ();

  logic [7:0] b;
  logic en_shl;
  logic [7:0] shl;

  ShiftLeftCircular shiftleft (b, en_shl, shl);

  initial begin
    en_shl = 1;
    b = 8'b01000000;
    $display("b: %b, shl: %b",b,shl);
    $finish;
  end

endmodule

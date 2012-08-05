/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Zero Detect testbench
 * License: MIT http://opensource.org/licenses/MIT
*/

module ZeroDetectTestBench ();

  logic [7:0] result;
  logic zero;

  ZeroDetect zero_detector (result, zero);

  initial begin
    result = 00000000;
    #1
    $display("result: %b, zero: %b",result,zero);
    $finish;
  end

endmodule

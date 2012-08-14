/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder block test bench
 * License: MIT http://opensource.org/licenses/MIT
*/

module AdderBlockTestBench ();

  wire b_bit, c_bit, carry_in, carry_in_n;
  wire sum_bit, carry_out, carry_out_n;

  logic b_bit_var, c_bit_var;

  assign b_bit = b_bit_var;
  assign c_bit = c_bit_var;

  AdderBlock adderblock (V, b_bit, c_bit, carry_in, carry_in_n,
                         sum_bit, carry_out, carry_out_n);

  initial begin
    b_bit_var = 1'b0;
    c_bit_var = 1'b1;
    #2
    $display("b_bit: %b, c_bit: %b, carry_in: %b, carry_in_n: %b, sum_bit: %b, carry_out: %b",b_bit, c_bit, carry_in, carry_in_n, sum_bit,carry_out);
    $finish;

  end

endmodule


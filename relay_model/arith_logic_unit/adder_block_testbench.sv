/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder block test bench
 * License: MIT http://opensource.org/licenses/MIT
*/

module AdderBlockTestBench ();

  logic b_bit, c_bit, carry_in, carry_in_n;
  logic sum_bit, carry_out, carry_out_n;

  AdderBlock adderblock (b_bit, c_bit, carry_in, carry_in_n,
                         sum_bit, carry_out, carry_out_n);

  initial begin
    carry_in = 1'b0;
    carry_in_n = 1'b1;

    b_bit = 1'b0;
    c_bit = 1'b1;
    #2
    $display("sum_bit: %b, carry_out: %b",sum_bit,carry_out);
    b_bit = 1'b0;
    c_bit = 1'b0;
    #2
    $display("sum_bit: %b, carry_out: %b",sum_bit,carry_out);
    b_bit = 1'b1;
    c_bit = 1'b1;
    #1
   
    $finish;

  end

endmodule


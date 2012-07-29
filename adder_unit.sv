/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module EightBitAdderUnit (input logic [7:0] b, c, 
                          output logic [7:0] adder_out
                          output logic carry);

  logic carry_out, carry_out_n,
        carry_in, carry_in_n,
        f,g,h,i,j,k;

  logic [7:0] b_in = b;
  logic [7:0] c_in = c;

  Relay relay1 (.control(b_in),
                .in_0(carry_out),
                .in_1(carry_in),
                .in_2(carry_in_n),
                .in_3(carry_out_n),
                .out_hi_0(g),
                .out_hi_1(i),
                .out_hi_2(h),
                .out_hi_3(k),
                .out_lo_0(f),
                .out_lo_1(h),
                .out_lo_2(i),
                .out_lo_3(j));

  Relay relay2 (.control(c_in),
                .in_0(carry_in),
                .in_1(V),
                .in_2(sum_out),
                .in_3(carry_in_n),
                .out_hi_0(f),
                .out_hi_1(g),
                .out_hi_2(i),
                .out_hi_3(j),
                .out_lo_0(g),
                .out_lo_1(j),
                .out_lo_2(h),
                .out_lo_3(k));

  always_comb begin
    for (int z = 0; z < 8; z++) begin
        b_in = b[z];
        c_in = c[z];
        sum[z] = sum_out;
    end
        carry = carry_out;
        $display("end.");
  end

endmodule

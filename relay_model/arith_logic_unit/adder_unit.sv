/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module EightBitAdderUnit (input logic clock,logic [7:0] b, c, 
                          output logic [7:0] adder_out,
                          output logic carry);

  wire b0,b1,b2,b3,b4,b5,b6,b7;

  assign b0 = b[0];
  assign b1 = b[1];
  assign b2 = b[2];
  assign b3 = b[3];
  assign b4 = b[4];
  assign b5 = b[5];
  assign b6 = b[6];
  assign b7 = b[7];

  wire c0,c1,c2,c3,c4,c5,c6,c7;

  assign c0 = c[0];
  assign c1 = c[1];
  assign c2 = c[2];
  assign c3 = c[3];
  assign c4 = c[4];
  assign c5 = c[5];
  assign c6 = c[6];
  assign c7 = c[7];

  wire sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7;

  logic sum0_var, sum1_var, sum2_var, sum3_var, sum4_var, sum5_var, sum6_var, sum7_var;

  assign sum0_var = sum0;
  assign sum1_var = sum1;
  assign sum2_var = sum2;
  assign sum3_var = sum3;
  assign sum4_var = sum4;
  assign sum5_var = sum5;
  assign sum6_var = sum6;
  assign sum7_var = sum7;

  wire c_in0;
  wire c_in_n0;
  wire c_out0, c_out1, c_out2, c_out3, c_out4, c_out5, c_out6, c_out7;
  wire c_out_n0, c_out_n1, c_out_n2, c_out_n3, c_out_n4, c_out_n5, c_out_n6, c_out_n7;

  AdderBlock adderblock0 (.b_bit(b0), .c_bit(c0), .carry_in(c_in0), .carry_in_n(c_in_n0),
                          .sum_bit(sum0), .carry_out(c_out0), .carry_out_n(c_out_n0));

  AdderBlock adderblock1 (.b_bit(b1), .c_bit(c1), .carry_in(c_out0), .carry_in_n(c_out_n0),
                          .sum_bit(sum1), .carry_out(c_out1), .carry_out_n(c_out_n1));

  AdderBlock adderblock2 (.b_bit(b2), .c_bit(c2), .carry_in(c_out1), .carry_in_n(c_out_n1),
                          .sum_bit(sum2), .carry_out(c_out2), .carry_out_n(c_out_n2));

  AdderBlock adderblock3 (.b_bit(b3), .c_bit(c3), .carry_in(c_out2), .carry_in_n(c_out_n2),
                          .sum_bit(sum3), .carry_out(c_out3), .carry_out_n(c_out_n3));

  AdderBlock adderblock4 (.b_bit(b4), .c_bit(c4), .carry_in(c_out3), .carry_in_n(c_out_n3),
                          .sum_bit(sum4), .carry_out(c_out4), .carry_out_n(c_out_n4));

  AdderBlock adderblock5 (.b_bit(b5), .c_bit(c5), .carry_in(c_out4), .carry_in_n(c_out_n4),
                          .sum_bit(sum5), .carry_out(c_out5), .carry_out_n(c_out_n5));

  AdderBlock adderblock6 (.b_bit(b6), .c_bit(c6), .carry_in(c_out5), .carry_in_n(c_out_n5),
                          .sum_bit(sum6), .carry_out(c_out6), .carry_out_n(c_out_n6));

  AdderBlock adderblock7 (.b_bit(b7), .c_bit(c7), .carry_in(c_out6), .carry_in_n(c_out_n6),
                          .sum_bit(sum7), .carry_out(c_out7), .carry_out_n(c_out_n7));

  always @(clock) begin
    #1
    $display("b: %b, c: %b",b,c);
    $display("sum0: %b",sum0_var);
    adder_out = {sum7_var,sum6_var,sum5_var,sum4_var,sum3_var,sum2_var,sum1_var,sum0_var};
    carry = c_out7;
  end
    
endmodule

 

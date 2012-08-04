/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module EightBitAdderUnit (input logic [7:0] b, c, 
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

  wire sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7;
  wire c_in0;
  wire c_in_n0;
  wire c_out0, c_out1, c_out2, c_out3, c_out4, c_out5, c_out6, c_out7;
  wire c_out_n0, c_out_n1, c_out_n2, c_out_n3, c_out_n4, c_out_n5, c_out_n6, c_out_n7;

  AdderBlock adderblock0 (.b_bit(b0), .c_bit(c0), .carry_in(c_in0), .carry_in_n(c_in_n0),
                          .sum_bit(sum0), .carry_out(c_out0), .carry_out_n(c_out_n0));
/*
  AdderBlock adderblock1 (.b_bit(b[1]), .c_bit(c[1]), .carry_in(c_out0), .carry_in_n(c_out_n0),
                          .sum_bit(sum1), .carry_out(c_out1), .carry_out_n(c_out_n1));

  AdderBlock adderblock2 (.b_bit(b[2]), .c_bit(c[2]), .carry_in(c_out1), .carry_in_n(c_out_n1),
                          .sum_bit(sum2), .carry_out(c_out2), .carry_out_n(c_out_n2));

  AdderBlock adderblock3 (.b_bit(b[3]), .c_bit(c[3]), .carry_in(c_out2), .carry_in_n(c_out_n2),
                          .sum_bit(sum3), .carry_out(c_out3), .carry_out_n(c_out_n3));

  AdderBlock adderblock4 (.b_bit(b[4]), .c_bit(c[4]), .carry_in(c_out3), .carry_in_n(c_out_n3),
                          .sum_bit(sum4), .carry_out(c_out4), .carry_out_n(c_out_n4));

  AdderBlock adderblock5 (.b_bit(b[5]), .c_bit(c[5]), .carry_in(c_out4), .carry_in_n(c_out_n4),
                          .sum_bit(sum5), .carry_out(c_out5), .carry_out_n(c_out_n5));

  AdderBlock adderblock6 (.b_bit(b[6]), .c_bit(c[6]), .carry_in(c_out5), .carry_in_n(c_out_n5),
                          .sum_bit(sum6), .carry_out(c_out6), .carry_out_n(c_out_n6));

  AdderBlock adderblock7 (.b_bit(b[7]), .c_bit(c[7]), .carry_in(c_out6), .carry_in_n(c_out_n6),
                          .sum_bit(sum7), .carry_out(c_out7), .carry_out_n(c_out_n7));
*/
  always @(b || c) begin
    #1
    adder_out = {sum7,sum6,sum5,sum4,sum3,sum2,sum1,sum0};
    carry = c_out7;
  end
    
endmodule

 

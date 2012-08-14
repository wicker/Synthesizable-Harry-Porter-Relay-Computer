/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module EightBitAdderUnit (input wire V, input logic [7:0] b, c, 
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

  assign sum0 = sum0_var;
  assign sum1 = sum1_var;
  assign sum2 = sum2_var;
  assign sum3 = sum3_var;
  assign sum4 = sum4_var;
  assign sum5 = sum5_var;
  assign sum6 = sum6_var;
  assign sum7 = sum7_var;

  wire c_in0, c_in_n0;
  wire c_out0, c_out1, c_out2, c_out3, c_out4, c_out5, c_out6, c_out7;
  wire c_out_n0, c_out_n1, c_out_n2, c_out_n3, c_out_n4, c_out_n5, c_out_n6, c_out_n7;

  AdderBlock adderblock0 (V, b0, c0, c_in0, c_in_n0, sum0_var, c_out0_var, c_out_n0_var);

  AdderBlock adderblock1 (V, b1, c1, c_out0, c_out_n0, sum1_var, c_out1_var, c_out_n1_var);

  AdderBlock adderblock2 (V, b2, c2, c_out1, c_out_n1, sum2_var, c_out2_var, c_out_n2_var);

  AdderBlock adderblock3 (V, b3, c3, c_out2, c_out_n2, sum3_var, c_out3_var, c_out_n3_var);

  AdderBlock adderblock4 (V, b4, c4, c_out3, c_out_n3, sum4_var, c_out4_var, c_out_n4_var);

  AdderBlock adderblock5 (V, b5, c5, c_out4, c_out_n4, sum5_var, c_out5_var, c_out_n5_var);

  AdderBlock adderblock6 (V, b6, c6, c_out5, c_out_n5, sum6_var, c_out6_var, c_out_n6_var);

  AdderBlock adderblock7 (V, b7, c7, c_out6, c_out_n6, sum7_var, c_out7_var, c_out_n7_var);

  always begin
    adder_out = {sum7,sum6,sum5,sum4,sum3,sum2,sum1,sum0};
    carry = c_out7;
  end
    
endmodule

 

/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Adder Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module EightBitAdderUnit (input logic [7:0] b, c, 
                          output logic [7:0] adder_out,
                          output logic carry);

  wire carry_out, carry_out_n,
        carry_in, carry_in_n,
        adder_out_pin,
        f,g,h,i,j,k;

  logic b_in, c_in, V_var;
  wire b_in_pin, c_in_pin;

  assign b_in_pin = b_in;
  assign c_in_pin = c_in;
  assign V = V_var;

  Relay relay1 (.control(b_in_pin),
                .in_0(carry_out),
                .in_1(carry_in),
                .in_2(carry_in_n),
                .in_3(carry_out_n),
                .out_lo_0(g),
                .out_lo_1(i),
                .out_lo_2(h),
                .out_lo_3(k),
                .out_hi_0(f),
                .out_hi_1(h),
                .out_hi_2(i),
                .out_hi_3(j));

  Relay relay2 (.control(c_in_pin),
                .in_0(carry_in),
                .in_1(V),
                .in_2(adder_out_pin),
                .in_3(carry_in_n),
                .out_lo_0(f),
                .out_lo_1(g),
                .out_lo_2(i),
                .out_lo_3(j),
                .out_hi_0(g),
                .out_hi_1(j),
                .out_hi_2(h),
                .out_hi_3(k));

  always @(b || c) begin
    V_var = 1;
    $display("working.");
    for (int a = 0; a < 8; a++) begin
        b_in = b[a];$display("b[a]: %b, b_in: %b",b[a],b_in); 
        c_in = c[a];$display("c[a]: %b, c_in: %b",c[a],c_in); 
        #1
        adder_out[a] = adder_out_pin; #1 $display("sum: %b\n",adder_out[a]);
    end
    carry = carry_out;
    $display("end.");
  end

endmodule

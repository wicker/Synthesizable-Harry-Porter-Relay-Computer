/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Finite State Automata module depends on clock to drive computer
 * License: MIT http://opensource.org/licenses/MIT
*/

module FSA (input logic clock, reset, output [2:0] fsm_out);

  wire logic cl0, cl1, cl2, cl3, cl4, cl5;
  wire logic s0, s1, s2, s3;
  wire logic thing0, thing1, thing2;
  wire logic temp0, temp1, temp2;
  wire logic V, thingreset;
  logic V_var, fsm;
  wire s0_not, s1_not, s2_not;

  assign s0_not = !s0;
  assign s1_not = !s1;
  assign reset_not = !reset;
  assign V = V_var;
  assign fsm_out = fsm;

  initial begin
    V_var = 1;
  end

  Relay relay_c0 (.control(clock),
                   .in_0(V),
                   .in_1(V),
                   .in_2(V),
                   .in_3(V),
                   .out_lo_0(cl0),
                   .out_hi_0(cl1),
                   .out_lo_1(cl2),
                   .out_hi_1(cl3),
                   .out_lo_2(cl4),
                   .out_hi_2(cl5),
                   .out_lo_3(cl6),
                   .out_hi_3(cl7));

  Relay relay_c1 (.control(clock),
                   .in_0(V),
                   .in_1(V),
                   .in_2(V),
                   .in_3(V),
                   .out_lo_0(cl8),
                   .out_hi_0(cl9),
                   .out_lo_1(cl10),
                   .out_hi_1(cl11),
                   .out_lo_2(cl12),
                   .out_hi_2(cl13),
                   .out_lo_3(cl14),
                   .out_hi_3(cl15));

  Relay relay_c2 (.control(clock),
                   .in_0(V),
                   .in_1(V),
                   .in_2(V),
                   .in_3(V),
                   .out_lo_0(cl16),
                   .out_hi_0(cl17),
                   .out_lo_1(cl18),
                   .out_hi_1(cl19),
                   .out_lo_2(cl20),
                   .out_hi_2(cl21),
                   .out_lo_3(cl22),
                   .out_hi_3(cl23));

  Relay relay_rst (.control(reset),
                   .in_0(V),
                   .in_1(cl0),
                   .in_2(s0_not),
                   .in_3(reset),
                   .out_lo_0(reset_not),
                   .out_hi_1(thingreset),
                   .out_hi_2(thingreset),
                   .out_hi_3(temp0));

  Relay relay_s0  (.control(reset),
                   .in_0(V),
                   .in_1(cl1),
                   .in_2(s1_not),
                   .in_3(thingreset),
                   .out_lo_0(s0_not),
                   .out_hi_0(s0),
                   .out_hi_1(thing0),
                   .out_hi_2(thing0),
                   .out_hi_3(temp1));

  Relay relay_s1  (.control(reset),
                   .in_0(V),
                   .in_1(cl2),
                   .in_2(s2_not),
                   .in_3(thing0),
                   .out_lo_0(temp1),
                   .out_hi_0(s1),
                   .out_hi_1(thing1),
                   .out_hi_2(thing1),
                   .out_hi_3(temp2));

  Relay relay_s2  (.control(reset),
                   .in_0(V),
                   .in_1(cl3),
                   .in_2(s3_not),
                   .in_3(thing1),
                   .out_lo_0(temp1),
                   .out_hi_0(s2),
                   .out_hi_1(thing2),
                   .out_hi_2(thing2),
                   .out_hi_3(temp3));

// just repeat relay_s1 and relay_s2 up to relay_22 and relay_23, 
// temp jumps every other relay

  always @(negedge clock) begin
    fsm = {s2,s1,s0};
  end

endmodule

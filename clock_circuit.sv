/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Clock Circuit which drives the rest of the computer
 * License: MIT http://opensource.org/licenses/MIT
*/

module ClockCircuit (input logic .power(power_var), .run_stop(run_stop_var), 
                     .single_step(single_step_var), output logic .clock(clock_var));

  parameter STOP = 0;
  parameter RUN = 1;
  parameter OFF = 0;
  parameter ON = 1;

  wire V, A, B, C, D, f, g, h, i;

  logic A_var, B_var, C_var, D_var;
  logic power_var, run_stop_var, single_step_var, clock_var;

  assign A = A_var;
  assign B = B_var;
  assign C = C_var;
  assign D = D_var;

/*  assign power = power_var;
  assign run_stop = run_stop_var;
  assign single_step = single_step_var;*/
  
  Relay relayA (.control(A),   
                .in_0(V),
                .in_2(i),
                .out_lo_0(f),
                .out_hi_2(B));

  Relay relayB (.control(B),   
                .in_0(V),
                .in_2(f),
                .out_lo_0(g),
                .out_hi_2(C));

  Relay relayC (.control(C),   
                .in_0(V),
                .in_2(g),
                .out_lo_0(h),
                .out_hi_2(D));

  Relay relayD (.control(D),   
                .in_0(V),
                .in_2(g),
                .out_lo_0(i),
                .out_hi_2(A));

  initial begin
    power_var = ON;
    run_stop_var = STOP;
    single_step_var = OFF;
    run_stop_var = RUN;
  end


  always @(run_stop_var == RUN) begin
    A_var = !C_var && !B_var; #1
    $display("A: %b, B: %b, C: %b, D: %b",A_var,B_var,C_var,D_var);
    B_var = !D_var && A_var; #1
    $display("A: %b, B: %b, C: %b, D: %b",A_var,B_var,C_var,D_var);
    C_var = !A_var && B_var; #1
    $display("A: %b, B: %b, C: %b, D: %b",A_var,B_var,C_var,D_var);
    D_var = !B_var && C_var; #1
    $display("A: %b, B: %b, C: %b, D: %b",A_var,B_var,C_var,D_var);

    // clock = C xor D
    // in reality, clock width is determined by size of capacitor
    // here we should just assume a timescale and call it good. 10ns?  
  end

endmodule

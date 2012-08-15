/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: FSA Testbench
 * License: MIT http://opensource.org/licenses/MIT
*/

module DecoderTestBench ();

  Ctrl_Bus ctrl ();

  InstructionDecoder decoder (ctrl, inst_reg, fsa_out, fsa_out_prime, ccr);

  logic [7:0] inst_reg_var;
  logic [23:0] fsa_out_var, fsa_out_prime_var;
  logic [2:0] ccr_var;

  assign ccr = ccr_var;
  assign inst_reg = inst_reg_var;
  assign fsa_out = fsa_out_var;

  initial begin 
    ccr_var = '0;
    inst_reg_var = '0;
    fsa_out_var = '0;
    #1 
    $display("pulses: %b,%b,%b,%b,%b",decoder.pA,decoder.pB,decoder.pC,decoder.pD,decoder.pE);
  end

endmodule

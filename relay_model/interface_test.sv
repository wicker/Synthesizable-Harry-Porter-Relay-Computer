//
// 1 Master, 2 Slaves Bus Interface in System Verilog
// Jenner Hanni - ECE510 - System Verilog - Summer 2012 - 7/21/2012
// Prof Mark Faust
//
// Interface skeleton.
//
// References: 
// = http://www.doulos.com/knowhow/sysverilog/tutorial/interfaces/
// = SystemVerilog for Design, 2nd Ed
// = Course materials
// 
// Otherwise, I certify that the entirety of this file is my own solo work.
//

module test_system ();

  logic clock, testbit;
  logic load, sel;
  int count;

  initial begin
    testbit = 0;
    clock = 0;
    forever #1 clock = ~clock;
  end

  always @(posedge clock) begin
    if (count < 10) begin
      $display("bit: %b, decoder.testbit: %b, control.ldA: %b,reg_A.load: %b",testbit,decoder.testbit,control.ldA,reg_A.load);
      testbit = ~testbit;
      count++;
    end
    else 
      $stop;
  end

  ControlBus control ();

  InstructionDecoder decoder (control, testbit);

  Reg_Type_ALU_Result reg_A (control);

endmodule

interface ControlBus();

  wire ldA, selA;

endinterface

module InstructionDecoder (ControlBus control, input logic testbit);

  assign control.ldA = testbit;

endmodule

module Reg_Type_ALU_Result (ControlBus control);

  logic load, sel;
  assign load = control.ldA;
  assign sel = control.selA;

endmodule

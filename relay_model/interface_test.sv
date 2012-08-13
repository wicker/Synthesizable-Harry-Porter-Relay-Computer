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

  logic clock, testbitA, testbitB;
  logic load, sel;
  int count;

  initial begin
    testbitA = 0;
    testbitB = 1;
    clock = 0;
    forever #1 clock = ~clock;
  end

  always @(posedge clock) begin
    if (count < 10) begin
      $display("bitA: %b, bitB: %b, decoder.testbitA: %b, decoder.testbitB: %b",testbitA, testbitB, decoder.testbitA, decoder.testbitB);
      $display("reg_A.load: %b,reg_B.load: %b, control.ldA: %b, control.ldB: %b",reg_A.load,reg_B.load,control.ldA,control.ldB);
      testbitA = ~testbitA;
      testbitB = ~testbitB;
      count++;
    end
    else 
      $stop;
  end

  ControlBus control ();

  InstructionDecoder decoder (control, testbitA, testbitB);

  RegA reg_A (control.reg_A);
  RegB reg_B (control);

endmodule

interface ControlBus();

  wire ldA, selA, ldB, selB;

endinterface

module InstructionDecoder (ControlBus control, input logic testbitA, testbitB);

  assign control.ldA = testbitA;
  assign control.ldB = testbitB;

endmodule

module RegA (ControlBus control);

  logic load, sel;
  assign load = control.ldA;
  assign sel = control.selA;

endmodule

module RegB (ControlBus control);

  logic load, sel;
  assign load = control.ldB;
  assign sel = control.selB;

endmodule


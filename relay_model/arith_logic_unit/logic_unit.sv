/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Logic Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module OneBitLogicBlock (input logic b, c, 
                         output logic result);
 
  Relay relay1 (.control(b_in),
                .in_1(V),
                .in_2(V),
                .in_3(V),
                .out_hi_1(g),
                .out_hi_2(OR_out),
                .out_hi_3(h),
                .out_lo_1(f),
                .out_lo_3(NOT_out));

  Relay relay2 (.control(c_in),
                .in_0(AND_out),
                .in_1(V),
                .in_2(XOR_out),
                .out_hi_0(h),
                .out_hi_1(OR_out),
                .out_hi_2(f),
                .out_lo_2(g));

  always_comb begin
    for (int z = 0; z < 8; z++) begin
        b_in = b[z];
        c_in = c[z];
    end
        $display("end.");
  end

endmodule 

module EightBitLogicUnit (input logic [7:0] b, c,
                          output logic [7:0] logic_out);

  wire f,g,h,AND_out,OR_out,XOR_out,NOT_out;

  logic [7:0] b_in = b;
  logic [7:0] c_in = c;

  OneBitLogicBlock onebitlogic1 ();
  OneBitLogicBlock onebitlogic2 ();
  OneBitLogicBlock onebitlogic3 ();
  OneBitLogicBlock onebitlogic4 ();
  OneBitLogicBlock onebitlogic5 ();
  OneBitLogicBlock onebitlogic6 ();
  OneBitLogicBlock onebitlogic7 ();
  OneBitLogicBlock onebitlogic8 ();
  
endmodule




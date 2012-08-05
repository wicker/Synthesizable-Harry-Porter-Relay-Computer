/* Author: Jenner Hanni
 * Project: Harry Porter Relay Computer
 * File: Logic Unit in the ALU
 * License: MIT http://opensource.org/licenses/MIT
*/

module EightBitLogicUnit (input logic [7:0] b, c,
                          output logic [7:0] logic_out);

  wire f,g,h,AND_out,OR_out,XOR_out,NOT_out;

  logic [7:0] b_in = b;
  logic [7:0] c_in = c;

  OneBitLogicBlock onebitlogic1;
  OneBitLogicBlock onebitlogic2;
  OneBitLogicBlock onebitlogic3;
  OneBitLogicBlock onebitlogic4;
  OneBitLogicBlock onebitlogic5;
  OneBitLogicBlock onebitlogic6;
  OneBitLogicBlock onebitlogic7;
  OneBitLogicBlock onebitlogic8;
  
endmodule

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

endmodule // EightBigLogicUnit


/*
 * Jenner: This is my implementation of the one bit logic block.
 * I recommend you investigate both of our implementations, as I have not
 * checked this for errors, but I have taken the time to re-transpose the
 * circuit diagram from the schematic without referring to yours.
 * I'm convinced my module has the correct input/output signature and,
 * when wired correctly, understand there will be no need for a behavioral
 * always_comb block.
 * 
 * Let me know if this helps,
 * 
 * - Brian
**/

module OneBitLogicBlock(input b, c, output out_not, out_and, out_or, out_xor);

   wire bridge1, bridge2, bridge3, bridgeV;
   
   Relay x(.control(b),
	   .in_1(bridgeV),
	   .in_2(bridgeV),
	   .in_3(bridgeV),
	   .out_lo_1(bridge1),
	   .out_hi_1(bridge2),
	   .out_hi_2(out_or),
	   .out_lo_3(out_not),
	   .out_hi_3(bridge3));
   
   Relay y(.control(c),
	   .in_0(out_and),
	   .in_1(bridgeV),
	   .in_2(out_xor),
	   .out_hi_0(bridge3),
	   .out_hi_1(out_or),
	   .out_lo_2(bridge2),
	   .out_hi_2(bridge1));
   
endmodule // OneBitLogicBlock

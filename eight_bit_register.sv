
module EightBitRegister(input hold, inout wire[7:0] val);
   
   genvar i;

   generate
      for(i=0; i<8; i++) begin
	 Register R(hold,val[i]);
      end
   endgenerate
   
endmodule // EightBitRegister

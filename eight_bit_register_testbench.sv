
module TestBench();

   reg hold;
   wire[7:0] val;

   reg [7:0] val_reg;
   reg enable_w;
   
   assign val = enable_w ? val_reg : 'z;
   
   EightBitRegister target(.*);

   task writeval(input [7:0] value);
      $display("writing %b", value);
      hold = 0;
      enable_w = 1;
      val_reg = value;
      hold = 1;
   endtask; // writeval

   task expect_read(input [7:0] expectation);
      enable_w = 0;
      $display("%b == %b\n", expectation, val);
   endtask; // expect_read
   
   initial begin
      $monitor("Enable_w: %b\nHold:   %b\nVal:    %b\n", enable_w, hold, val);

      writeval(8'b11111111);
      #1 expect_read(8'b11111111);

      #1 hold = 0'b0;
      #1 expect_read(8'bxxxxxxxx);
      
      #1 writeval(8'b00000000);
      #1 expect_read(8'b00000000);

      #1 hold = 0'b0;
      #1 expect_read(8'bxxxxxxxx);
	
   end

endmodule
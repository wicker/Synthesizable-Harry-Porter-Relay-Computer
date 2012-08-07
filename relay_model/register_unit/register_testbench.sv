/* Author: Brian Ledger 
 * Project: Harry Porter Relay Computer 
 * License: MIT http://opensource.org/licenses/MIT 
*/

module TestBench();

   reg hold;
   wire val;

   reg val_reg;
   reg enable_w;
   
   assign val = enable_w ? val_reg : 'z;
   
   Register target(.*);

   task writeval(input value);
      $display("writing %b", value);
      hold = 0;
      enable_w = 1;
      val_reg = value;
      hold = 1;
   endtask; // writeval

   task expect_read(input expectation);
      enable_w = 0;
      $display("%b == %b\n", expectation, val);
   endtask; // expect_read
   
   initial begin
      $monitor("Enable_w: %b\nHold:   %b\nVal:    %b\n", enable_w, hold, val);

      writeval(1'b1);
      #1 expect_read(1'b1);

      #1 hold = 0'b0;
      #1 expect_read(1'bx);
      
      #1 writeval(1'b0);
      #1 expect_read(1'b0);

      #1 hold = 0'b0;
      #1 expect_read(1'bx);
	
   end

endmodule

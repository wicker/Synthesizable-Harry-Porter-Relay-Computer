/* Relay testbench */

module TestBench();

   const bit LOW = 0'b0;
   const bit HIGH = 1'b1;

   reg control;
   wire in_0, in_1, in_2, in_3;
   wire out_lo_0, out_lo_1, out_lo_2, out_lo_3;
   wire out_hi_0, out_hi_1, out_hi_2, out_hi_3;
   
   reg 	drive_0, drive_1, drive_2;

   assign in_0 = drive_0;
   assign out_hi_1 = drive_1;
   assign out_lo_2 = drive_2;
   
   Relay target(.*);
   
   initial begin
      $monitor("  %b\n%b\n  %b\n  %b\n%b\n  %b\n  %b\n%b\n  %b\n  %b\n%b\n  %b\n\n--%b\n\n\n", 
	       out_hi_0, in_0, out_lo_0,
	       out_hi_1, in_1, out_lo_1,
	       out_hi_2, in_2, out_lo_2,
	       out_hi_3, in_3, out_lo_3,
	       control);
      
      control = HIGH;
      drive_0 = HIGH;
      drive_1 = HIGH;
      drive_2 = HIGH;

      #1 control = LOW;
      drive_0 = LOW;
      drive_1 = LOW;
      drive_2 = LOW;
      
      #1;
      
   end

endmodule // TestBench

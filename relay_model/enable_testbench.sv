
module TestBench();

   reg control, enable;
   reg [7:0] write_line, write_bus;
   wire [7:0] line;
   wire [7:0] bus;

   assign bus  =  enable ? write_bus  : 'z;
   assign line = ~enable ? write_line : 'z;
   
   Enable target(.*);

   initial begin
      $monitor("Control: %b\nBus:     %b\nLine:    %b\n", control, bus, line);

      control = 0;
      
      #1 enable = 1;
      write_bus = 8'b01010101;

      #1 enable = 0;
      write_line = 8'b10101010;

      #1 control = 1;

      #1 enable = 1;
      write_bus = 8'b11110000;
      
      #1 enable = 0;
      write_line = 8'b00001111;

      #1 $finish;
      
   end

endmodule // TestBench

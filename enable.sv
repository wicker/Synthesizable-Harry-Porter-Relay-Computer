
module Enable(input control, inout [7:0] line, inout [7:0] bus);

   Relay low(control,
	     line[0], line[1], line[2], line[3],
	     bus[0], bus[1], bus[2], bus[3]);
   
   Relay high(control,
	      line[4], line[5], line[6], line[7],
	      bus[4], bus[5], bus[6], bus[7]);
   
endmodule // Enable

	      
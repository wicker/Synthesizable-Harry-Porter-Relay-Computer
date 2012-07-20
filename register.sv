
module Register(input hold, inout val);

   Relay relay(.control(val), .in_3(val), .out_hi_3(hold));
   
endmodule
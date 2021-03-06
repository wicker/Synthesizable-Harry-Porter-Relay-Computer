
module top; // top dut

	import output_struct_package::*;
	
	
	output_struct all_output[5000];

//
// clock for module
//

    logic loadMemComplete;
    reg transaction_complete = 1;
    reg clock = 1;
    // tbx clkgen
    initial begin
      clock = 0;
      forever #5
	    if(loadMemComplete == 1)
        clock = ~clock;
    end
      

/*
//	clock for transactions
//	
	reg transaction_clock =1;
	initial begin
		transaction_clock = 0;
		forever #5
		begin
		if(!transaction_complete)
			transaction_clock = ~transaction_clock;
		end
	end*/
// 
// DUT instantiation
// - The DUT is nothing but pipeline of registers that is 1024 deep
//   and 8 bit wide.
//
	output_struct from_comp;
	wire [($bits(output_struct)-1):0] returned_from_comp;
	logic loadMem = 0;
	logic [14:0][7:0] initial_memory; // filled by transaction
	Harry_Porter_Comp #($bits(output_struct)) Relay_Comp(clock, loadMem, initial_memory, returned_from_comp, loadMemComplete);
	
	assign from_comp = returned_from_comp;

	/* give stimulus to DUT and start computer
	always @(posedge transaction_complete)
	begin
		loadMem = 1; 
		// when the memory is loaded into the computer loadMemComplete will be asserted and 
		// the clock that drives the Dut will be activated until a Halt command is reached
	end */
	initial begin
	  $monitor($time, " %b" ,clock);
	  end
	initial begin
	  initial_memory[0] = 8'b01000010; // Load 2 into A
		initial_memory[1] = 8'b01100011; // Load 3 into B
		initial_memory[2] = 8'b00000010; // Mov A to C
		initial_memory[3] = 8'b10000000; // ALU ADD into A
		initial_memory[4] = 8'b10101110; // Halt execution
		
		loadMem = 1;
		
		#2 $display( " %p ", initial_memory);
		#2 $display(" %p ", Relay_Comp.mem.memory);
		#1 loadMem = 0;
		
//		#5000 $display("%p", all_output);

#500		$stop;
		
	end
	
	
	//receive output data into output_struct array 
	int i = 0;
	always @(from_comp)
	begin
		all_output[i] = from_comp;
		$display(" %p" , all_output[i]);
		i <= i+1;
	end
	
 /*   scemi_input_pipe #( .BYTES_PER_ELEMENT(1),
                        .PAYLOAD_MAX_ELEMENTS(1),
                        .BUFFER_MAX_ELEMENTS(35000)
                      )  inputpipe();
   
//
// XRTL FSM that fetches the byte stream from HVL applies to the DUT
// one each clock. Single byte is fetched at each clock edge  using scemi_input pipe receive call.
// It stops once it receives end of message(eom) .
//

    bit [7:0] data;
    reg [7:0] ne_valid = 0;
	int input_count = 0;

    always @(posedge transaction_clock)
    begin
	static bit eom = 0;
	if(eom != 0)
        begin
          inputpipe.receive(1,ne_valid,data,eom);
          initial_memory[input_count] <= data; 
        end
		else
		begin
			transaction_complete = 1;
		end
    end


//
//- XRTL FSM that captures the output character stream and sends it
//  to the HVL testbench.
// -pipe has internal buffering mechanism , each call of send pipe
//  adds data to buffer untill the buffer is full .
// - bytes with the value 8'hff are ignored
// - byte with value '0' is taken as the end of stream and the flush
//  operation is performed on the pipe

    scemi_output_pipe #( .BYTES_PER_ELEMENT(12),
                         .PAYLOAD_MAX_ELEMENTS(1),
                         .BUFFER_MAX_ELEMENTS(10000)
                       )  outputpipe();

    output_struct tosend;
    always @(posedge transaction_clock) 
    begin
	int output_returned;
        if(from_comp.Halt && transaction_complete)
        begin
		foreach(all_output[output_returned])
		begin
			tosend = output_returned;
            outputpipe.send(1,tosend,1);
                end
        end
        outputpipe.flush();
        
    end
        
    */
endmodule

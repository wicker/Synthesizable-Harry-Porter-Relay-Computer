
module top; // top dut

	import output_struct_package::*;
	
	output_struct from_comp;
	
	output_struct all_output[];

//
// clock for module
//

    reg clock = 1;
    // tbx clkgen
    initial begin
      clock = 0;
      forever #5
	  begin
	  if(from_comp.Halt !== 1 && transaction_complete && loadMemComplete)
        clock = ~clock;
	  end
    end

//
//	clock for transactions
//	
	reg transaction_complete = 0;
	reg transaction_clock =1;
	initial begin
		transaction_clock = 0;
		forever #5
		begin
		if(!transaction_complete)
			transaction_clock = ~transaction_clock;
		end
	end
// 
// DUT instantiation
// - The DUT is nothing but pipeline of registers that is 1024 deep
//   and 8 bit wide.
//
	logic loadMem = 0;
	logic loadMemComplete = 0;
	logic [14:0][7:0] initial_memory; // filled by transaction
	Harry_Porter_Comp Relay_Comp(clock, loadMem, initial_memory, from_comp, loadMemComplete);

	// give stimulus to DUT and start computer
	@(posedge transaction_complete)
	begin
		loadMem = 1; 
		// when the memory is loaded into the computer loadMemComplete will be asserted and 
		// the clock that drives the Dut will be activated until a Halt command is reached
	end
	
	//receive output data into output_struct array 
	int i = 0;
	always_comb
	begin
		all_output[i] = from_comp;
		i = i+1;
	end
	
    scemi_input_pipe #( .BYTES_PER_ELEMENT(1),
                        .PAYLOAD_MAX_ELEMENTS(1),
                        .BUFFER_MAX_ELEMENTS(35000)
                      )  inputpipe();
   
//
// XRTL FSM that fetches the byte stream from HVL applies to the DUT
// one each clock. Single byte is fetched at each clock edge  using scemi_input pipe receive call.
// It stops once it receives end of message(eom) .
//

    bit eom = 0;
    bit [7:0] data;
	int input_count = 0;

    always @(posedge transaction_clock)
    begin
        if(!eom)
        begin
          inputpipe.receive(1,data,eom);
          initial_memory[i] <= data; 
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
        if(from_comp.Halt && transaction_complete)
        begin
		foreach(output_returned in all_ouput)
		begin
			tosend = output_returned;
            outputpipe.send(1,to_send);
        end
        outputpipe.flush();
        end
    end
        
    
endmodule

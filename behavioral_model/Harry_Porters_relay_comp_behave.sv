/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: Haarry_Porters_relay_comp_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 module Harry_Porter_Comp #(parameter size_of_struct = 91) (input logic clock, loadMem, 
				input logic [14:0][7:0] initial_memory, 
				output wire [(size_of_struct-1):0] outcome, 
				output logic loadMemComplete);

	import output_struct_package::*;
	// instantiate interfaces
	registerInterface registers();
	programControlInterface PCI();
	buses Buses();
	controlSignals control_signals();
	output_struct output_signals;

	assign outcome = output_signals;
	
	//instantiate modules
	Sequencer_Behave sequenceUnit(.clock(clock), 
	                             .program_control(PCI.decoder_inst_port), 
	                             .buses(Buses.Buses), 
	                             .control_signals(control_signals.sequencerPort));
	memory mem(.initial_memory(initial_memory), 
	           .loadMem(loadMem), 
	           .control_signals(control_signals.memoryPort),
	           .buses(Buses.Memory),
	            .loadMemComplete(loadMemComplete));
	Alu_Behave alu(registers.Bpins, registers.Cpins, control_signals.AluFunctionCode, Buses.DataBus, 
					control_signals.sign, control_signals.carry, control_signals.zero);
	registerUnit regUnit(.buses(Buses.Buses), .control_signals(control_signals.registerUnitPort), .registers(registers));
	programControlUnit PCU(.buses(Buses.Buses), .control_signals(control_signals.programControlPort), .PCsigs(PCI));	
				
	always_comb
	begin	
		output_signals.addressBus = Buses.addressBusPins;
		output_signals.dataBus = Buses.dataBusPins;
		output_signals.fsm_state = sequenceUnit.fsm.outputState;
		output_signals.instruction_reg = PCI.Instpins;
		output_signals.LdA = control_signals.LdApin;
		output_signals.LdB = control_signals.LdBpin;
		output_signals.LdC = control_signals.LdCpin;
		output_signals.LdD = control_signals.LdDpin;
		output_signals.LdM1 = control_signals.LdM1pin;
		output_signals.LdM2 = control_signals.LdM2pin;
		output_signals.LdX = control_signals.LdXpin;
		output_signals.LdY = control_signals.LdYpin;
		output_signals.LdJ1 = control_signals.LdJ1pin;
		output_signals.LdJ2 = control_signals.LdJ2pin;
		output_signals.LdInst = control_signals.LdInstpin;
		output_signals.LdPC = control_signals.LdPCpin;
		output_signals.LdInc = control_signals.LdINCpin;
		output_signals.LdCond = control_signals.LdCondpin;
		output_signals.SelA = control_signals.SelApin;
		output_signals.SelB = control_signals.SelBpin;
		output_signals.SelC = control_signals.SelCpin;
		output_signals.SelD = control_signals.SelDpin;
		output_signals.SelM1 = control_signals.SelM1pin;
		output_signals.SelM2 = control_signals.SelM2pin;
		output_signals.SelX = control_signals.SelXpin;
		output_signals.SelY = control_signals.SelYpin;
		output_signals.SelXY = control_signals.LdXYpin;
		output_signals.SelM = control_signals.SelMpin;
		output_signals.SelXY = control_signals.SelXYpin;
		output_signals.SelJ = control_signals.SelJpin;
		output_signals.SelPC = control_signals.SelPCpin;
		output_signals.SelInc = control_signals.SelINCpin;
		output_signals.MemRead = control_signals.MemReadpin;
		output_signals.MemWrite = control_signals.MemWritepin;
		output_signals.Halt = control_signals.Haltpin;
		
	end
	
 endmodule

/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: Haarry_Porters_relay_comp_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 module Harry_Porter_Comp(input clock, loadMem, input logic [15:0][7:0] initial_memory, output Halt);
 
	logic halt_output;
 
	// instantiate interfaces
	registerInterface registers();
	programControlInterface PCI();
	buses Buses();
	controlSignals control_signals();
	
	//instantiate modules
	Sequencer_Behave sequenceUnit(clock, registers.Instpins, Buses, control_signals);
	memory mem(initial_memory, loadMem, control_signals.memoryPort, Buses);
	Alu_Behave alu(registers.Bpins, registers.Cpins, control_signals.AluFunctionCode, Buses.dataBusPins, 
					control_signals.sign, control_signals.carry, control_signals.zero);
	registerUnit regUnit(Buses, control_signals.registerUnitPort, registers);
	programControlUnit PCU(Buses, control_signals.programControlPort, PCsigs);				
				
 endmodule
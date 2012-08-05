/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: interfaces_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */
 
 interface registersInterface();
	modport RegisterUnitRegisters{
		output wire [7:0] 	Apins,
							Bpins,
							Cpins,
							Dpins,
							M1pins,
							M2pins,
							Xpins,
							Ypins;
		input logic [7:0]	A,
							B,
							C,
							D,
							M1,
							M2,
							X,
							Y;}
	modport ProgramControlUnitRegisters{
		output wire [7:0]	J1pins,
							J2pins,
							Instpins,
							PCpins;
		output wire [15:0]	Incpins;
		input logic [7:0]	J1,
							J2,
							Inst,
							PC;
		input logic [15:0]	Inc;}
		
	assign Apins = A;
	assign Bpins = B;
	assign Cpins = C;
	assign Dpins = D;
	assign M1pins = M1;
	assign M2pins = M2;
	assign Xpins = X;
	assign Ypins = Y;
	assign J1pins = J1;
	assign J2pins = J2;
	assign Instpins = Inst;
	assign Incpins = Inc;
 endinterface
 
 interface dataBus (input clock, interface controlSignals);
	input logic [7:0] dataBus;
	output wire [7:0] dataBusPins;
	
	assign dataBusPins = dataBus;
 endinterface
 
 interface addressBus(input clock, interface controlSignals);
	input logic [15:0] addressBus;
	output wire [15:0] addressBusPins;
	
	assign addressBusPins = addressBus;
 
 endinterface
 
 interface controlSignals();
	input logic 	LdA,
					LdB,
					LdC,
					LdD,
					LdM1,
					LdM2,
					LdX,
					LdY,
					LdJ1,
					LdJ2,
					LdInst,
					LdPC,
					LdINC,
					SelA,
					SelB,
					SelC,
					SelD,
					SelM1,
					SelM2,
					SelX,
					SelY,
					LdXY,
					SelM,
					SelXY,
					SelJ,
					SelPC,
					SelINC;
	input logic [2:0] AluFunctionCode;
	
	output 	LdApin,
			LdBpin,
			LdCpin,
			LdDpin,
			LdM1pin,
			LdM2pin,
			LdXpin,
			LdYpin,
			LdJ1pin,
			LdJ2pin,
			LdInstpin,
			LdPCpin,
			LdINCpin,
			SelApin,
			SelBpin,
			SelCpin,
			SelDpin,
			SelM1pin,
			SelM2pin,
			SelXpin,
			SelYpin,
			LdXYpin,
			SelMpin,
			SelXYpin,
			SelJpin,
			SelPCpin,
			SelINCpin;
	output wire [2:0] AluFunctionCodePins;
	assign 	LdApin = LdA;
	assign 	LdBpin = LdB;
	assign 	LdCpin = LdC;
	assign 	LdDpin = LdD;
	assign 	LdM1pin = LdM1;
	assign 	LdM2pin = LdM2;
	assign 	LdXpin = LdX;
	assign 	LdYpin = LdY;
	assign 	LdXYpin = LdXY;
	assign 	LdJ1pin = LdJ1;
	assign 	LdJ2pin = LdJ2;
	assign 	LdInstpin = LdInst;
	assign 	LdPCpin = LdPC;
	assign 	LdINCpin = LdINC;
	assign 	SelApin = SelA;
	assign 	SelBpin = SelB;
	assign 	SelCpin = SelC;
	assign 	SelDpin = SelD;
	assign 	SelM1pin = SelM1;
	assign 	SelM2pin = SelM2;
	assign 	SelMpin = SelM;
	assign 	SelXYpin = SelXY;
	assign 	SelJpin = SelJ;
	assign 	SelPCpin = SelPC;
	assign 	SelINCpin = SelINC;
	assign	AluFunctionCode = AluFunctionCodePins;	
 endinterface	
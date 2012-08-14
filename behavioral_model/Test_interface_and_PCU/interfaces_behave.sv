/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: interfaces_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */

 interface buses();
	wire [7:0] dataBusPins;
	wire [15:0] addressBusPins;
	
	//modport AddressBus (inout addressBusPins);
	
	//modport DataBus( output dataBusPins);
	
	modport Buses( input dataBusPins, inout addressBusPins);
	
	//modport Memory(input addressBusPins, inout dataBusPins);
	
 endinterface
 
 // Interface to hold all of the registers in Harry Porter's Relay Computer
 interface registerInterface();
	wire [7:0]  Apins,
				Bpins,
				Cpins,
				Dpins,
				M1pins,
				M2pins,
				Xpins,
				Ypins;
	wire[15:0]	Mpins,
				XYpins;
	
	logic [7:0]	A = 0,
				B = 0,
				C = 0,
				D = 0,
				M1 = 0,
				M2 = 0,
				X = 0,
				Y = 0;
	
	assign Apins = A;
	assign Bpins = B;
	assign Cpins = C;
	assign Dpins = D;
	assign M1pins = M1;
	assign M2pins = M2;
	assign Mpins = {M1,M2};
	assign Xpins = X;
	assign Ypins = Y;
	assign XYpins = {X,Y};
 endinterface
 
 // Interface to hold all of the registers in the program control unit Harry Porter's Relay Computer
 interface programControlInterface();
	wire [7:0]  	J1pins,
					J2pins,
					Instpins;
	wire [15:0]		Incpins,
					PCpins,
					Jpins;
	logic [7:0]		J1,
					J2,
					Inst;			
	logic [15:0]	Inc,
					PC = 0;
					
	assign J1pins = J1;
	assign J2pins = J2;
	assign Jpins = {J1,J2};
	assign Instpins = Inst;
	assign Incpins = Inc;
	assign PCpins = PC;
	
	modport decoder_inst_port ( input Instpins);
 
 endinterface
 
 interface controlSignals();
  logic zero, carry, sign;
	wire zeropin, carrypin, signpin;
  
	logic   LdA,
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
					LdXY,
					LdCond,
					SelA,
					SelB,
					SelC,
					SelD,
					SelM1,
					SelM2,
					SelX,
					SelY,
					SelM,
					SelXY,
					SelJ,
					SelPC,
					SelINC, 
					MemRead,
					MemWrite,
					Halt = 0;
	logic [2:0] AluFunctionCode = '1;
	logic [3:0] fsmInput = 0;
	
	wire 	LdApin,
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
			LdCondpin,
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
			SelINCpin,
			MemReadpin,
			MemWritepin,
			Haltpin;
	wire [2:0] AluFunctionCodepins;
	wire [3:0] fsmInputpins;
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
	assign	LdCondpin = LdCond;
	assign 	SelApin = SelA;
	assign 	SelBpin = SelB;
	assign 	SelCpin = SelC;
	assign 	SelDpin = SelD;
	assign 	SelM1pin = SelM1;
	assign 	SelM2pin = SelM2;
	assign 	SelMpin = SelM;
	assign  SelXpin = SelX;
	assign  SelYpin = SelY;
	assign 	SelXYpin = SelXY;
	assign 	SelJpin = SelJ;
	assign 	SelPCpin = SelPC;
	assign 	SelINCpin = SelINC;
	assign	AluFunctionCodepins = AluFunctionCode;
	assign fsmInputpins = fsmInput;
	assign MemReadpin = MemRead;
	assign MemWritepin = MemWrite;
	assign zeropin = zero;
	assign carrypin = carry;
	assign signpin = sign;
	assign Haltpin = Halt;
	
	modport registerUnitPort ( input LdApin, input SelApin,
								input LdBpin, input SelBpin,
								input LdCpin, input SelCpin,
								input LdDpin, input SelDpin,
								input LdM1pin, input SelM1pin,
								input LdM2pin, input SelM2pin,
								input SelMpin,
								input LdXpin, input SelXpin,
								input LdYpin, input SelYpin,
								input LdXYpin, input SelXYpin );
	modport programControlPort (input LdJ1pin, 
								input LdJ2pin, input SelJpin,
								input LdInstpin,
								input LdPCpin, input SelPCpin,
								input LdINCpin, input SelINCpin);
	modport memoryPort (input MemReadpin, input MemWritepin);
	modport decodePort (output LdA, output LdB, output LdC, output LdD,
						output LdM1, output LdM2, output LdX, output LdY,
						output LdJ1, output LdJ2, output LdInst, output LdPC,
						output LdINC, output LdXY, output LdCond, output SelA,
						output SelB, output SelC, output SelD, output SelM1,
						output SelM2, output SelX, output SelY, output SelM,
						output SelXY, output SelJ, output SelPC, output SelINC, 
						output MemRead, output MemWrite, output Halt,
						output AluFunctionCode, output fsmInput);
	modport sequencerPort (output LdA, output LdB, output LdC, output LdD,
						output LdM1, output LdM2, output LdX, output LdY,
						output LdJ1, output LdJ2, output LdInst, output LdPC,
						output LdINC, output LdXY, output LdCond, output SelA,
						output SelB, output SelC, output SelD, output SelM1,
						output SelM2, output SelX, output SelY, output SelM,
						output SelXY, output SelJ, output SelPC, output SelINC, 
						output MemRead, output MemWrite, output Halt,
						output AluFunctionCode, output fsmInput, 
						input LdApin, input LdBpin, input LdCpin, input LdDpin,
						input LdM1pin, input LdM2pin, input LdXpin, input LdYpin,
						input LdJ1pin, input LdJ2pin, input LdInstpin, input LdPCpin,
						input LdINCpin, input LdCondpin, input SelApin, input SelBpin,
						input SelCpin, input SelDpin, input SelM1pin, input SelM2pin,
						input SelXpin, input SelYpin, input LdXYpin, input SelMpin,
						input SelXYpin, input SelJpin, input SelPCpin, input SelINCpin,
						input MemReadpin, input MemWritepin, input Haltpin,
						input AluFunctionCodepins, input fsmInputpins, input zeropin,
						input carrypin, input signpin);
 endinterface	

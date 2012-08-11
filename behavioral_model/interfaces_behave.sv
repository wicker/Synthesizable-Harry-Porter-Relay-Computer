/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: interfaces_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */

 interface buses;
	wire [7:0] dataBusPins;
	wire [15:0] addressBusPins;
	
	modport AddressBus ( output addressBusPins );
	
	modport DataBus( output dataBusPins );
	
 endinterface
 
 // Interface to hold all of the registers in Harry Porter's Relay Computer
 interface registerInterface;
	logic zero, carry, sign;
	wire zeropin, carrypin, signpin;
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
	
	logic [7:0]	A,
				B,
				C,
				D,
				M1,
				M2,
				X,
				Y;
	
	assign zeropin = zero;
	assign carrypin = carry;
	assign signpin = sign;
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
 interface programControlInterface;
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
					PC;
					
	assign J1pins = J1;
	assign J2pins = J2;
	assign Jpins = {J1,J2};
	assign Instpins = Inst;
	assign Incpins = Inc;
	assign PCpins = PC;
 
 endinterface
 
 interface controlSignals;
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
					SelINC, 
					MemRead,
					MemWrite,
					Halt;
	logic [2:0] AluFunctionCode;
	logic [3:0] fsmInput;
	
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
	assign	AluFunctionCodepins = AluFunctionCode;
	assign fsmInputpins = fsmInput;
	assign MemReadpin = MemRead;
	assign MemWritepin = MemWrite;
	assign Haltpin = Halt;
	
	modport registerUnitPort ( 	input LdApin, output LdA, input SelApin, output SelA,
								input LdBpin, output LdB, input SelBpin, output SelB,
								input LdCpin, output LdC, input SelCpin, output SelC,
								input LdDpin, output LdD, input SelDpin, output SelD,
								input LdM1pin, output LdM1, input SelM1pin, output SelM1,
								input LdM2pin, output LdM2, input SelM2pin, output SelM2,
								input LdXpin, output LdX, input SelXpin, output SelX,
								input LdYpin, output LdY, input SelYpin, output SelY,
								input LdXYpin, output LdXY, input SelXYpin, output SelXY );
	modport progromControlPort (input LdJ1pin, output LdJ1, 
								input LdJ2pin, output LdJ2, input SelJpin, output SelJ,
								input LdInstpin, output LdInst,
								input LdPCpin, output LdPC, input SelPCpin, output SelPC,
								input LdINCpin, output LdINC, input SelINCpin, output SelINC);
	modport memoryControlPort (input MemReadpin, input MemWritepin);
 endinterface	
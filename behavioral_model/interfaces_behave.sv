/* Author: Maisee Brown
 * Project: Harry Porter Relay Computer 
 * File: interfaces_behave.sv
 * License: MIT http://opensource.org/licenses/MIT
 */

 interface buses;
	logic [7:0] dataBus;
	wire [7:0] dataBusPins;
	logic [15:0] addressBus;
	wire [15:0] addressBusPins;
	
	assign dataBusPins = dataBus;
	assign addressBusPins = addressBus;
	
	modport AddressBus ( input addressBus, output addressBusPins);
	
	modport DataBus( input dataBus, output dataBusPins);
	
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
					PCpins
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
					MemRead;
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
			MemReadpin;
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
	
	modport registerUnitPort { 	input LdA, output LdApin, input SelA, output SelApin,
								input LdB, output LdBpin, input SelB, output SelBpin,
								input LdC, output LdCpin, input SelC, output SelCpin,
								input LdD, output LdDpin, input SelD, output SelDpin,
								input LdM1, output LdM1pin, input SelM1, output SelM1pin,
								input LdM2, output LdM2pin, input SelM2, output SelM2,
								input LdX, output LdXpin, input SelX, output SelXpin,
								input LdY, output LdYpin, input SelY, output SelYpin,
								input LdXY, output LdXYpin, input SelXY, output SelXYpin }
	modport progromControlPort {input LdJ1, output LdJ1pins, 
								input LdJ2, output LdJ2pins, input SelJ, output SelJpin,
								input LdInst, output LdInstpin,
								input LdPC, output LdPCpin, input SelPC, output SelPCpin,
								input LdINC, output LdINCpin, input SelINC, output SelINCpin}
 endinterface	
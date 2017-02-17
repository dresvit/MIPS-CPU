`timescale 1ns / 1ps

module myCPU_test;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] PCinit;

	// Outputs
	wire [31:0] PC;
	wire [31:0] nextPC;
	wire [31:0] instruction;
	wire [5:0] opcode;
	wire [4:0] ReadReg1;
	wire [4:0] ReadReg2;
	wire [4:0] WriteReg;
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;
	wire [31:0] ExtDataOut;
	wire [31:0] ALUB;
	wire [2:0] ALUOp;
	wire [31:0] ALUresult;
	wire [31:0] DDataOut;
	wire [31:0] WriteData;
	wire zero;
	wire PCWre;
	wire ALUSrcB;
	wire ALUM2Reg;
	wire RegWre;
	wire DataMemRW;
	wire ExtSel;
	wire PCSrc;
	wire RegOut;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.reset(reset), 
		.PCinit(PCinit), 
		.PCAddrIn(nextPC), 
		.PCAddrOut(PC), 
		.instruction(instruction), 
		.opcode(opcode), 
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.WriteReg(WriteReg), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2), 
		.ExtDataOut(ExtDataOut), 
		.ALUB(ALUB), 
		.ALUOp(ALUOp), 
		.ALUresult(ALUresult), 
		.DDataOut(DDataOut), 
		.WriteData(WriteData), 
		.zero(zero), 
		.PCWre(PCWre), 
		.ALUSrcB(ALUSrcB), 
		.ALUM2Reg(ALUM2Reg), 
		.RegWre(RegWre), 
		.DataMemRW(DataMemRW), 
		.ExtSel(ExtSel), 
		.PCSrc(PCSrc), 
		.RegOut(RegOut)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		PCinit = 32'h00000100;
		clk = 0;
		clk = 1;
		#5;
		reset = 0;
		clk = 0;
		#5;
		clk = 1;
		forever #5 clk = ~clk;
        
		// Add stimulus here

	end
      
endmodule


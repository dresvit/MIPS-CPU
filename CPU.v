`timescale 1ns / 1ps

//CPU¶¥²ãÄ£¿é
module CPU (
	clk, reset, PCinit, PCAddrIn, PCAddrOut, instruction, opcode, ReadReg1, ReadReg2,
	WriteReg, ReadData1, ReadData2, ExtDataOut, ALUB, ALUOp, ALUresult, DDataOut, WriteData,
	zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, DataMemRW, ExtSel, PCSrc, RegOut
	);
	
	input clk, reset;
	input [31:0] PCinit;
	output zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, DataMemRW, ExtSel, PCSrc, RegOut;
	output [2:0] ALUOp;
	output [4:0] ReadReg1, ReadReg2, WriteReg;
	output [5:0] opcode;
	output [31:0] instruction, PCAddrIn, PCAddrOut, ExtDataOut,
				WriteData, ReadData1, ReadData2, ALUB, ALUresult, DDataOut;
	
	 PC my_PC (
	 .PCinit(PCinit), 
    .AddrIn(PCAddrIn), 
    .AddrOut(PCAddrOut), 
    .clk(clk), 
	 .reset(reset), 
    .PCWre(PCWre)
    );
	 
	 NextPC my_NextPC (
    .AddrIn(PCAddrOut), 
    .offset(ExtDataOut), 
    .AddrOut(PCAddrIn), 
    .PCSrc(PCSrc)
    );
	 
	 InsMem my_InsMem (
	 .PCinit(PCinit), 
    .IAddr(PCAddrOut), 
    .IDataOut(instruction)
    );
	 
	 assign opcode = instruction[31:26];
	 
	 CU my_CU (
    .decode(instruction[31:26]), 
    .zero(zero), 
    .PCWre(PCWre), 
    .ALUSrcB(ALUSrcB), 
    .ALUM2Reg(ALUM2Reg), 
    .RegWre(RegWre), 
    .DataMemRW(DataMemRW), 
    .ExtSel(ExtSel), 
    .PCSrc(PCSrc), 
    .RegOut(RegOut), 
    .ALUOp(ALUOp)
    );
	 
	 Mux2x5 my_Mux2x5 (
    .a(instruction[20:16]), 
    .b(instruction[15:11]), 
    .s(RegOut), 
    .y(WriteReg)
    );
	 
	 assign ReadReg1 = instruction[25:21];
	 assign ReadReg2 = instruction[20:16];
	 
	 RegFile my_RegFile (
    .ReadReg1(instruction[25:21]), 
    .ReadReg2(instruction[20:16]), 
    .WriteReg(WriteReg), 
	 .WriteData(WriteData), 
    .RegWre(RegWre), 
    .clk(clk), 
    .reset(reset), 
    .ReadData1(ReadData1), 
    .ReadData2(ReadData2)
    );
	 
	 Extend my_Extend (
    .DataIn(instruction[15:0]), 
    .DataOut(ExtDataOut), 
    .ExtSel(ExtSel)
    );
	 
	 Mux2x32 my_Mux2x32_1 (
    .a(ReadData2), 
    .b(ExtDataOut), 
    .s(ALUSrcB), 
    .y(ALUB)
    );
	 
	 ALU my_ALU (
    .A(ReadData1), 
    .B(ALUB), 
    .ALUOp(ALUOp), 
    .zero(zero), 
    .result(ALUresult)
    );
	 
	 DataMem my_DataMem (
    .DAddr(ALUresult), 
    .DataIn(ReadData2), 
    .DataOut(DDataOut), 
    .DataMemRW(DataMemRW)
    );
	 
	 Mux2x32 my_Mux2x32_2 (
    .a(ALUresult), 
    .b(DDataOut), 
    .s(ALUM2Reg), 
    .y(WriteData)
    );
endmodule

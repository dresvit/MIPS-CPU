`timescale 1ns / 1ps

//¿ØÖÆµ¥Ôª
module CU(
	decode,
   zero,
   PCWre,
	ALUSrcB,
	ALUM2Reg,
	RegWre,
	DataMemRW,
	ExtSel,
	PCSrc,
	RegOut,
	ALUOp
	);
   
	input [5:0] decode;
	input zero;
	output reg PCWre, ALUSrcB, ALUM2Reg, RegWre, DataMemRW, ExtSel, PCSrc, RegOut;
	output reg [2:0] ALUOp;
	
	always @(decode) begin
		case(decode)
			// add, R-format
			6'b000000:
			begin
				PCWre <= 1;
				ALUSrcB <= 0;
				ALUM2Reg <= 0;
				RegWre <= 1;
				DataMemRW <= 1'bx;
				PCSrc <= 0;
				RegOut <= 1;
				ALUOp <= 3'b000;
			end
			
			// sub, R-format
			6'b000010:
			begin
				PCWre <= 1;
				ALUSrcB <= 0;
				ALUM2Reg <= 0;
				RegWre <= 1;
				DataMemRW <= 1'bx;
				PCSrc <= 0;
				RegOut <= 1;
				ALUOp <= 3'b001;
			end
			
			// and, R-format
			6'b010001:
			begin
				PCWre <= 1;
				ALUSrcB <= 0;
				ALUM2Reg <= 0;
				RegWre <= 1;
				DataMemRW <= 1'bx;
				PCSrc <= 0;
				RegOut <= 1;
				ALUOp <= 3'b100;
			end
			
			// or, R-format
			6'b010010:
			begin
				PCWre <= 1;
				ALUSrcB <= 0;
				ALUM2Reg <= 0;
				RegWre <= 1;
				DataMemRW <= 1'bx;
				PCSrc <= 0;
				RegOut <= 1;
				ALUOp <= 3'b011;
			end
			
			// move, R-format
			6'b100000:
			begin
				PCWre <= 1;
				ALUSrcB <= 0;
				ALUM2Reg <= 0;
				RegWre <= 1;
				DataMemRW <= 1'bx;
				PCSrc <= 0;
				RegOut <= 1;
				ALUOp <= 3'b000;
			end
			
			// addi, I-format
			6'b000001:
			begin
				PCWre <= 1;
				ALUSrcB <= 1;
				ALUM2Reg <= 0;
				RegWre <= 1;
				DataMemRW <= 1'bx;
				ExtSel <= 1;
				PCSrc <= 0;
				RegOut <= 0;
				ALUOp <= 3'b000;
			end
			
			// ori, I-format
			6'b010000:
			begin
				PCWre <= 1;
				ALUSrcB <= 1;
				ALUM2Reg <= 0;
				RegWre <= 1;
				DataMemRW <= 1'bx;
				ExtSel <= 0;
				PCSrc <= 0;
				RegOut <= 0;
				ALUOp <= 3'b011;
			end
			
			// sw, I-format
			6'b100110:
			begin
				PCWre <= 1;
				ALUSrcB <= 1;
				RegWre <= 0;
				DataMemRW <= 1;
				ExtSel <= 1;
				PCSrc <= 0;
				ALUOp <= 3'b000;
			end
			
			// lw, I-format
			6'b100111:
			begin
				PCWre <= 1;
				ALUSrcB <= 1;
				ALUM2Reg <= 1;
				RegWre <= 1;
				DataMemRW <= 0;
				ExtSel <= 1;
				PCSrc <= 0;
				RegOut <= 0;
				ALUOp <= 3'b000;
			end
			
			// beq, I-format
			6'b110000:
			begin
				PCWre = 1;
				ALUSrcB = 0;
				RegWre = 0;
				DataMemRW <= 1'bx;
				ExtSel = 1;
				ALUOp = 3'b001;
				#0.001;
				PCSrc = zero;
			end
			
			// halt, J-format
			6'b111111:
			begin
				PCWre <= 0;
				DataMemRW <= 1'bx;
			end
		endcase
	end
endmodule

`timescale 1ns / 1ps

//������һ��ָ��ĵ�ַ
module NextPC (AddrIn, offset, AddrOut, PCSrc);
	input [31:0] AddrIn, offset;
	output reg [31:0] AddrOut;
	input PCSrc;
	
	always@(AddrIn or offset or PCSrc) begin
		if (PCSrc == 0)
			AddrOut = AddrIn + 4;
		else
			AddrOut = AddrIn + 4 + (offset << 2);
	end
endmodule

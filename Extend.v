`timescale 1ns / 1ps

//À©Õ¹
module Extend (DataIn, DataOut, ExtSel);
	input [15:0] DataIn;
	output [31:0] DataOut;
	input ExtSel;
	
	assign DataOut = (ExtSel && DataIn[15]) ? {16'hffff, DataIn} : {16'h0000, DataIn};
endmodule

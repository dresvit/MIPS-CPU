`timescale 1ns / 1ps

//5λ2ѡ1����ѡ����
module Mux2x5 (a, b, s, y);
	input [4:0] a, b;
	input s;
	output [4:0] y;
	assign y = s ? b : a;
endmodule

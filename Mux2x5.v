`timescale 1ns / 1ps

//5位2选1数据选择器
module Mux2x5 (a, b, s, y);
	input [4:0] a, b;
	input s;
	output [4:0] y;
	assign y = s ? b : a;
endmodule

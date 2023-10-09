`timescale 1 ps / 1 ps

module task1 (address, clk, data, wren, q);
	input [4:0] address;
	input clk, wren; // wren = [wr]ite [en]able
	input [2:0] data;
	output [2:0] q;
	
	ram32x3 ram (.address(address), .clock(clk), .data(data), .wren(wren), .q(q));
endmodule
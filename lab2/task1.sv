`timescale 1 ps / 1 ps
// task1 is a module that implements read and write functions to memory by using RAM. This task
// takes the input signals of: 1-bit clk and wren, 3-bit data, 5-bit address. Then uses those
// signals to instantiate ram32x3, which is a single-port RAM with capacity of 32 words and 3 bits
// per word.
module task1 (address, clk, data, wren, q);
	input [4:0] address;
	input clk, wren; // wren = [wr]ite [en]able
	input [2:0] data;
	output [2:0] q;
	
	// Connects the signals as specified by the header comment to this single-port RAM.
	ram32x3 ram (.address(address), .clock(clk), .data(data), .wren(wren), .q(q));
endmodule // task1
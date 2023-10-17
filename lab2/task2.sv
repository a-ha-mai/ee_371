`timescale 1 ps / 1 ps

// task2 is a module that implements read and write functions to memory using SystemVerilog and
// implements the functionality of single-port ram.
// The 3-bit data is sent to memory_array at a given 5-bit address. memory_array has a capacity of
// 32 words with each word being 3-bits. This module then outputs the value of memory_array the given
// 5-bit address as a 3-bit signal named q.
module task2 (address, clk, reset, data, wren, q);
	logic [2:0] memory_array [31:0];
	
	input logic [4:0] address;
	input logic clk, reset, wren; // wren = [wr]ite [en]able
	input logic [2:0] data;
	output logic [2:0] q;
	
	always_ff @(posedge clk) begin
		if (reset) begin
			integer i;
//			memory_array[31:0] = 3'b000;
			for (i = 0; i < 32; i = i + 1) begin
				memory_array[i] = 3'b000; // Set your desired initial value here
			end
		end else begin
			if (wren) begin
				memory_array[address] <= data;
			end
			q <= memory_array[address];
		end
	end
endmodule

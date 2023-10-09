`timescale 1 ps / 1 ps

module task2 (address, clk, reset, data, wren, enable, q);
	logic [2:0] memory_array [31:0];
	
	input logic [4:0] address;
	input logic clk, reset, wren, enable; // wren = [wr]ite [en]able
	input logic [2:0] data;
	output logic [2:0] q;
	
	always_ff @(posedge clk) begin
		if (reset) begin
			integer i;
			for (i = 0; i < 32; i = i + 1) begin
				memory_array[i] = 3'b000; // Set your desired initial value here
			end
		end else begin
			if (wren & ~enable) begin
				memory_array[address] <= data;
				q <= memory_array[address];
			end else begin
				q <= memory_array[address];
			end
		end
	end
endmodule

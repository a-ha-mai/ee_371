`timescale 1 ps / 1 ps

module task3 (address, clk, data, wren, enable, q);
	input [4:0] address;
	input clk, wren, enable; // wren = [wr]ite [en]able
	input [2:0] data;
	output [2:0] q;
	logic write_to_file;
	
	ram32x3port2 ram (.clock(clk), .data(data), .rdaddress(address), .wraddress(address), .wren(write_to_file), .q(q));
	
	always_ff @(posedge clk) begin
		write_to_file <= wren & enable;
	end
endmodule
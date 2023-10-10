`timescale 1 ps / 1 ps

module task3 (rdaddress, wraddress, clk, data, wren, select, q);
	input [4:0]  rdaddress, wraddress;
	input clk, wren, select; // wren = [wr]ite [en]able
	input [2:0] data;
	output [2:0] q;
	logic write_to_file;
	
	ram32x3port2 ram (.clock(clk), .data(data), .rdaddress(rdaddress), .wraddress(wraddress), .wren(write_to_file), .q(q));
	
	always_ff @(posedge clk) begin
		write_to_file <= wren & select;
	end
	
endmodule
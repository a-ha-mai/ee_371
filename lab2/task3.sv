`timescale 1 ps / 1 ps
// task3 is a module that implements read and write functions to memory by using RAM. This task
// takes the input signals of: 1-bit clk and wren, 3-bit data, 5-bit address. Then uses those
// signals to instantiate ram32x3port2, which is a simplified dual-port RAM with capacity of
// 32 words and 3 bits per word and separate ports for write address (wraddress) and
// read address (rdaddress). The 1-bit select input determines if task3's memory is selected
// and if it'll be written to.
module task3 (rdaddress, wraddress, clk, data, wren, select, q);
	input [4:0]  rdaddress, wraddress;
	input clk, wren, select; // wren = [wr]ite [en]able
	input [2:0] data;
	output [2:0] q;
	logic write_to_file;
	
	// Connects the signals as specified by the header comment to this single-port RAM.
	ram32x3port2 ram (.clock(clk), .data(data), .rdaddress(rdaddress), .wraddress(wraddress), .wren(write_to_file), .q(q));
	
	// Only write to file if task 3 is selected and wren is active
	always_ff @(posedge clk) begin
		write_to_file <= wren & select;
	end
	
endmodule
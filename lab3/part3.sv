// Implements the N-sample averaging FIR filter.
module part3 (clk, reset, write, r_data, f_data);
	input  logic clk, reset, write;
	input  logic [23:0] r_data;
	output logic [23:0] f_data;
	
	logic empty, full;
	logic [23:0] fifo_data, add1_data, add2_data, accumulator_data;
	
	parameter N = 4;
	parameter DATA_WIDTH = 24;
	parameter ADDR_WIDTH = 3;
	
	// division
	assign in = {{N{r_data[DATA_WIDTH-1]}}, r_data[DATA_WIDTH-1:N]};
	
	fifo #(DATA_WIDTH, ADDR_WIDTH) fifo1 (.clk(clk), .reset(reset), .rd(write), .wr(write), .empty(empty), .full(full), .w_data(in), .r_data(fifo_data));
	adder #(DATA_WIDTH) adder1 (.a(fifo_data), .b(in), .sum(add1_data));
	adder #(DATA_WIDTH) adder2 (.a(add1_data), .b(accumulator_data), .sum(f_data));
	accumulator #(DATA_WIDTH) accumulator1 (.clk(clk), .reset(reset), .enable(write), .d(f_data), .q(accumulator_data));
endmodule
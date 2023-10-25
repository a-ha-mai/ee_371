// Implements the N-sample averaging FIR filter.
module part3 (clk, reset, write, r_data, f_data);
	parameter N = 4;
	parameter DATA_WIDTH = 24;
	parameter ADDR_WIDTH = 2;
	
	input  logic clk, reset, write;
	input  logic [DATA_WIDTH-1:0] r_data;
	output logic [DATA_WIDTH-1:0] f_data;
	
	logic empty, full;
	logic [DATA_WIDTH-1:0] fifo_data, add1_data, add2_data, accumulator_data;
	logic [ADDR_WIDTH-1:0] w_addr;
	
	// division
	assign in = {{N{r_data[DATA_WIDTH-1]}}, r_data[DATA_WIDTH-1:N]};
	
	fifo #(DATA_WIDTH, ADDR_WIDTH) fifo1 (.clk(clk), .reset(reset), .rd(write), .wr(write), .empty(empty), .full(full), .w_data(in), .w_addr(w_addr), .r_data(fifo_data));
	adder #(DATA_WIDTH) adder1 (.a(-1 * fifo_data), .b(in), .sum(add1_data));
	adder #(DATA_WIDTH) adder2 (.a(add1_data), .b(accumulator_data), .sum(f_data));
	accumulator #(DATA_WIDTH, ADDR_WIDTH) accumulator1 (.clk(clk), .reset(reset), .enable(write), .full(full), .w_addr(w_addr), .d(f_data), .q(accumulator_data));
endmodule

module part3_tb ();
	parameter DATA_WIDTH = 24;

	logic clk, reset, write;
	logic [DATA_WIDTH-1:0] r_data;
	logic [DATA_WIDTH-1:0] f_data;
	
	part3 part3_unit (.*);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		write <= 0; r_data <= 24'b0; f_data <= 24'b0;
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		write <= 1; r_data <= 24'b1; 
		write <= 1; r_data <= 24'b111111111111111111111111; repeat (16) @(posedge clk);
		
		$stop;
	end
endmodule // part3_tb
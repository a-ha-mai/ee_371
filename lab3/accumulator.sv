/* adds the value of d to the stored accumulator value and outputs the sum */
module accumulator #(parameter DATA_WIDTH=24, ADDR_WIDTH=2, N=4)
						  (clk, reset, enable, full, w_addr, d, q);
	input  logic clk, reset, enable, full;
	input  logic [ADDR_WIDTH:0] w_addr;
	input  logic [DATA_WIDTH:0] d;
	output logic [DATA_WIDTH:0] q;
	
	logic [DATA_WIDTH:0] accumulator;
	
	always_ff @(posedge clk) 
		if (reset) accumulator <= 0;
		else if (full & enable) accumulator <= d + accumulator;
		else if (~full & enable) accumulator <= (d + accumulator) * (N / (w_addr + 1));
		else accumulator <= accumulator;
	
	assign q = accumulator;
endmodule // accumulator

module accumulator_tb ();
	parameter DATA_WIDTH = 24;
	parameter ADDR_WIDTH = 2;
	parameter N = 4;
	
	logic clk, reset, enable, full;
	logic [ADDR_WIDTH:0] w_addr;
	logic [DATA_WIDTH:0] d;
	logic [DATA_WIDTH:0] q;
	logic [DATA_WIDTH:0] accumulator;
	
	accumulator #(DATA_WIDTH, ADDR_WIDTH, N) a_unit (.*);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		enable <= 0; full <= 0; d <= 24'b0; w_addr <= 2'b00;
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		enable <= 1; full <= 0; d <= 24'b1; w_addr <= 2'b00; @(posedge clk);
		enable <= 1; full <= 0; d <= 24'b1; w_addr <= 2'b01; @(posedge clk);
		enable <= 1; full <= 0; d <= 24'b1; w_addr <= 2'b10; @(posedge clk);
		enable <= 1; full <= 0; d <= 24'b1; w_addr <= 2'b11; @(posedge clk);
		enable <= 1; full <= 1; d <= 24'b1; w_addr <= 2'b00; @(posedge clk);
		enable <= 1; full <= 1; d <= 24'b1; w_addr <= 2'b01; @(posedge clk);
		enable <= 1; full <= 1; d <= 24'b1; w_addr <= 2'b10; @(posedge clk);
		enable <= 1; full <= 1; d <= 24'b1; w_addr <= 2'b11; @(posedge clk);
		$stop;
	end
endmodule
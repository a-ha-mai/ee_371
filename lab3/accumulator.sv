/* adds the value of d to the stored accumulator value and outputs the sum */
module accumulator #(parameter DATA_WIDTH=24, ADDR_WIDTH=3, N=4)
						  (clk, reset, enable, full, w_addr, d, q);
	input  logic clk, reset, enable, full;
	input  logic [ADDR_WIDTH:0] w_addr;
	input  logic [DATA_WIDTH:0] d;
	output logic [DATA_WIDTH:0] q;
	
	logic [DATA_WIDTH:0] accumulator;
	
	always_ff @(posedge clk) 
		if (reset) accumulator <= 0;
		else if (full & enable) accumulator <= d + accumulator;
		else if (~full & enable) accumulator <= (d + accumulator) * (N / w_addr);
		else accumulator <= accumulator;
	
	assign q = accumulator;
endmodule // accumulator
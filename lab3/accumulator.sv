/* adds the value of d to the stored accumulator value and outputs the sum */
module accumulator #(parameter DATA_WIDTH=24)
						  (clk, reset, d, q);
	input  logic clk, reset;
	input  logic [DATA_WIDTH:0] d;
	output logic [DATA_WIDTH:0] q;
	
	logic [DATA_WIDTH:0] accumulator;
	
	always_ff @(posedge clk) 
		if (reset) accumulator <= 0;
		else accumulator <= d + accumulator;
	
	assign q = accumulator;
endmodule // accumulator
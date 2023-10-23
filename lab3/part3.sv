// Implements the N-sample averaging FIR filter.
module part3 (CLOCK_50, reset, write, readdata);
	input logic CLOCK_50, reset, write;
	output logic [15:0] readdata;
	// division
	assign divided = {{n{readdata[w-1]}}, readdata[w-1:n]};
	
	// multiply by -1
	assign divided = -1 * divided;
	
	// add FIFO?
endmodule
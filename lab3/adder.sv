// adder module for adding 2 inputs together and outputs the sum
module adder #(parameter DATA_WIDTH=24)
				  (a, b, sum);
	
	input  logic [DATA_WIDTH:0] a, b;
	output logic [DATA_WIDTH:0] sum;
	
	assign sum = a + b;
endmodule // adder
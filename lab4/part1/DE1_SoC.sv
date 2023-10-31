module DE1_SoC (CLOCK_50, KEY, SW, HEX0, LEDR);
	input logic CLOCK_50;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [6:0] HEX0;
	output logic [9:0] LEDR;
	
	logic reset, s;
	logic [2:0] result;
	
	dff_pair dff_1 (.clk(CLOCK_50), .d(KEY[0]), .q(reset));
	dff_pair dff_2 (.clk(CLOCK_50), .d(KEY[3]), .q(s));
	top_level tl_unit (.clk(CLOCK_50), .reset(KEY[0]), .s(KEY[3]), .A_val(SW[7:0]), .done(LEDR[9]), .result(result));
	seg7 (.hex(result), .leds(HEX0));
	
endmodule // DE1_SoC
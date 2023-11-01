module DE1_SoC (CLOCK_50, KEY, SW, HEX0, HEX1, LEDR);
	input logic CLOCK_50;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX1;
	output logic [9:0] LEDR;
	
	logic reset, s;
	logic [4:0] loc;
	
	dff_pair dff_1 (.clk(CLOCK_50), .d(~KEY[3]), .q(reset));
	dff_pair dff_2 (.clk(CLOCK_50), .d(~KEY[0]), .q(s));
	top_level tl_unit (.clk(CLOCK_50), .reset(reset), .s(s), .A(SW[7:0]), .done(LEDR[9]), .found(LEDR[0]), .loc(loc));
	seg7 (.hex(loc[3:0]), .leds(HEX0));
	seg7 (.hex(loc[4]), .leds(HEX1));
	
endmodule // DE1_SoC
module DE1_SoC (CLOCK_50, KEY, SW, HEX0, HEX1, LEDR);
	input logic CLOCK_50;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX1;
	output logic [9:0] LEDR;
	
	logic reset, s, p1_done, p2_done, p2_found;
	logic [3:0] h0, h1, result;
	logic [4:0] loc;
	
	assign LEDR[0] = SW[9] ? p2_found : 0;
	assign LEDR[9] = SW[9] ? p2_done : p1_done;
	assign h0 = SW[9] ? loc[3:0] : result;
	assign h1 = SW[9] ? loc[4] : 0;
	
	dff_pair dff_1 (.clk(CLOCK_50), .d(~KEY[3]), .q(reset));
	dff_pair dff_2 (.clk(CLOCK_50), .d(~KEY[0]), .q(s));
	p1_top_level tl_unit (.clk(CLOCK_50), .reset(reset), .s(s), .A_val(SW[7:0]), .done(p1_done), .result(result));
	p2_top_level p2_tl_unit (.clk(CLOCK_50), .reset(reset), .s(s), .A(SW[7:0]), .done(p2_done), .found(p2_found), .loc(loc));
	seg7 h_unit0 (.hex(h0), .leds(HEX0));
	seg7 h_unit1 (.hex(h1), .leds(HEX1));
	
endmodule // DE1_SoC
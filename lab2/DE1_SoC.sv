`timescale 1 ps / 1 ps

// DE1_SoC implements the memory from task2 onto the FPGA board. If write is enabled (1-bit wren),
// then the 3-bit DataIn (SW[3], SW[2], SW[1]) written to the given 5-bit Address
// (SW[8], SW[7], SW[6], SW[5], SW[4] of task2's memory. The 3-bit DataOut represents the value
// read and is shown on HEX0. 
module DE1_SoC (CLOCK_50, KEY, SW, HEX0, HEX1, HEX4, HEX5);
	input logic CLOCK_50;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX1, HEX4, HEX5;
	
	logic clk;
	logic [2:0] DataIn, DataOut;
	logic [3:0] h0, h1, h4, h5;
	logic [4:0] Address;
	
	assign DataIn = SW[3:1];
	assign Address = SW[8:4];
	
	// Connect signals as specified by the header comment.
	dff_pair dff2 (.clk(CLOCK_50), .d(~KEY[0]), .q(clk));
	task2 t2 (.address(Address), .clk(clk), .reset(KEY[3]), .data(DataIn), .wren(SW[0]), .q(DataOut));
	
	// Connect hexadecimal values to 7-segment displays to display them on the board.
	seg7 hex0 (.hex(h0), .leds(HEX0));
	seg7 hex1 (.hex(h1), .leds(HEX1));
	seg7 hex4 (.hex(h4), .leds(HEX4));
	seg7 hex5 (.hex(h5), .leds(HEX5));
	
	// Converts Address, DataIn, and DataOut from binary to hexadecimal, and assigns that value to
	// 7-segment displays.
	always_comb begin
		// show address on HEX5 and 4
		h5 = Address[4];
		case (Address[3:0])
			4'b0000: h4 = 1'h0;
			4'b0001: h4 = 1'h1;
			4'b0010: h4 = 1'h2;
			4'b0011: h4 = 1'h3;
			4'b0100: h4 = 1'h4;
			4'b0101: h4 = 1'h5;
			4'b0110: h4 = 1'h6;
			4'b0111: h4 = 1'h7;
			4'b1000: h4 = 1'h8;
			4'b1001: h4 = 1'h9;
			4'b1010: h4 = 1'hA;
			4'b1011: h4 = 1'hB;
			4'b1100: h4 = 1'hC;
			4'b1101: h4 = 1'hD;
			4'b1110: h4 = 1'hE;
			4'b1111: h4 = 1'hF;
			default: h4 = 1'h0;
		endcase
		
		// show DataIn on HEX1
		case (DataIn)
			4'b0000: h1 = 1'h0;
			4'b0001: h1 = 1'h1;
			4'b0010: h1 = 1'h2;
			4'b0011: h1 = 1'h3;
			4'b0100: h1 = 1'h1;
			4'b0101: h1 = 1'h5;
			4'b0110: h1 = 1'h6;
			4'b0111: h1 = 1'h7;
			default: h1 = 1'h0;
		endcase
		
		// show DataOut on HEX0
		case (DataOut)
			4'b0000: h0 = 1'h0;
			4'b0001: h0 = 1'h0;
			4'b0010: h0 = 1'h2;
			4'b0011: h0 = 1'h3;
			4'b0100: h0 = 1'h0;
			4'b0101: h0 = 1'h5;
			4'b0110: h0 = 1'h6;
			4'b0111: h0 = 1'h7;
			default: h0 = 1'h0;
		endcase
	end

endmodule
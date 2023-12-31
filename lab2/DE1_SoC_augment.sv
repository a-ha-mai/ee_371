`timescale 1 ps / 1 ps

// DE1_SoC_augment is similar to DE1_SoC. One difference the implementation of 2 different
// memory modules. Only 1 memory can be written to at a time, which is picked  by using the
// 1-bit select signal.
module DE1_SoC_augment (CLOCK_50, KEY, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input logic CLOCK_50;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	logic [2:0] DataIn, DataOut, DataOut2, DataOut3;
	logic [3:0] h0, h1, h2, h3, h4, h5;
	logic [4:0] rdaddress, wraddress;
	logic [31:0] div_clk;
	
	assign DataIn = SW[3:1];
	assign wraddress = SW[8:4];
	
	// Connect signals as specified by the header comment.
	task2_augment t2 (.rdaddress(rdaddress), .wraddress(wraddress), .clk(CLOCK_50), .reset(KEY[3]), .data(DataIn), .wren(SW[0]), .select(SW[9]), .q(DataOut2));
	task3 t3 (.rdaddress(rdaddress), .wraddress(wraddress), .clk(CLOCK_50), .data(DataIn), .wren(SW[0]), .select(SW[9]), .q(DataOut3));
	
	// Takes the board clock and divides to clock to use for scenarios where a different interval is needed.
	clock_divider cd(.clock(CLOCK_50), .divided_clocks(div_clk));
	
	// Connect hexadecimal values to 7-segment displays to display them on the board.
	seg7 hex0 (.hex(h0), .leds(HEX0));
	seg7 hex1 (.hex(h1), .leds(HEX1));
	seg7 hex2 (.hex(h2), .leds(HEX2));
	seg7 hex3 (.hex(h3), .leds(HEX3));
	seg7 hex4 (.hex(h4), .leds(HEX4));
	seg7 hex5 (.hex(h5), .leds(HEX5));
	
	
	// Converts wraddress, rdaddress, DataIn, and DataOut from binary to hexadecimal, and assigns that value to
	// 7-segment displays.
	always_comb begin
		
		case (wraddress[4])
			1: h5 = 4'h1;
			default: h5 = 4'h0;
		endcase
		
//		// show write address (wraddress) on HEX 5 & 4
//		if (wraddress[4]) begin
//			h5 = 4'h1;
//		end else begin
//			h4 = 4'h0;
//		end
		
		case (wraddress[3:0])
			4'b0000: h4 = 4'h0;
			4'b0001: h4 = 4'h1;
			4'b0010: h4 = 4'h2;
			4'b0011: h4 = 4'h3;
			4'b0100: h4 = 4'h4;
			4'b0101: h4 = 4'h5;
			4'b0110: h4 = 4'h6;
			4'b0111: h4 = 4'h7;
			4'b1000: h4 = 4'h8;
			4'b1001: h4 = 4'h9;
			4'b1010: h4 = 4'hA;
			4'b1011: h4 = 4'hB;
			4'b1100: h4 = 4'hC;
			4'b1101: h4 = 4'hD;
			4'b1110: h4 = 4'hE;
			4'b1111: h4 = 4'hF;
			default: h4 = 4'h0;
		endcase
		
		// show write data (DataIn) on HEX1
		case (DataIn)
			4'b0000: h1 = 4'h0;
			4'b0001: h1 = 4'h1;
			4'b0010: h1 = 4'h2;
			4'b0011: h1 = 4'h3;
			4'b0100: h1 = 4'h4;
			4'b0101: h1 = 4'h5;
			4'b0110: h1 = 4'h6;
			4'b0111: h1 = 4'h7;
			default: h1 = 4'h0;
		endcase
		
		case (rdaddress[4])
			1: h3 = 4'h1;
			default: h3 = 4'h0;
		endcase
		
		// show read address (rdaddress) value on HEX 3 & 2
// 		if (rdaddress[4]) begin
// 			h3 = 4'h1;
// 		end else begin
// 			h3 = 4'h0;
// 		end
		case (rdaddress[3:0])
			4'b0000: h2 = 4'h0;
			4'b0001: h2 = 4'h1;
			4'b0010: h2 = 4'h2;
			4'b0011: h2 = 4'h3;
			4'b0100: h2 = 4'h4;
			4'b0101: h2 = 4'h5;
			4'b0110: h2 = 4'h6;
			4'b0111: h2 = 4'h7;
			4'b1000: h2 = 4'h8;
			4'b1001: h2 = 4'h9;
			4'b1010: h2 = 4'hA;
			4'b1011: h2 = 4'hB;
			4'b1100: h2 = 4'hC;
			4'b1101: h2 = 4'hD;
			4'b1110: h2 = 4'hE;
			4'b1111: h2 = 4'hF;
			default: h2 = 4'h0;
		endcase
		
		// pick which memory to read data from
		if (SW[9]) begin
			DataOut = DataOut3;
// 			HEX3 = h3;
// 			HEX2 = h2;
		end else begin
			DataOut = DataOut2;
// 			HEX3 = 7'b1111111;
// 			HEX2 = 7'b1111111;
		end
		
		// show read data (DataOut) value on HEX0
		case (DataOut)
			4'b0000: h0 = 4'h0;
			4'b0001: h0 = 4'h1;
			4'b0010: h0 = 4'h2;
			4'b0011: h0 = 4'h3;
			4'b0100: h0 = 4'h4;
			4'b0101: h0 = 4'h5;
			4'b0110: h0 = 4'h6;
			4'b0111: h0 = 4'h7;
			default: h0 = 4'h0;
		endcase
	end
	
	// Increments rdaddress by 1 every clock cycle and loops back to 0 after hitting 31.
	// Gets set to 0 if system is reset.
	always_ff @(posedge CLOCK_50) begin
		if (~KEY[3]) rdaddress <= 0;
		else if (rdaddress < 5'b11111) rdaddress = rdaddress + 1;
		else rdaddress <= 5'b0;
	end
endmodule
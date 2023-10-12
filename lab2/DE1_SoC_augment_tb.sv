`timescale 1 ps / 1 ps

module DE1_SoC_augment_tb ();
	logic CLOCK_50, clk;
	logic [3:0] KEY;
	logic [9:0] SW;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	logic [2:0] DataIn, DataOut;
	logic [3:0] h0, h1, h4, h5;
	logic [4:0] rdaddress, wraddress;
	
	DE1_SoC_augment dut (.CLOCK_50(clk), .KEY(KEY), .SW(SW), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3),.HEX4(HEX4), .HEX5(HEX5));
	
	parameter CLOCK_PERIOD = 100;
	
	// initialize signals
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		// initialize signals
		SW[9] <= 0;
		SW[8:4] <= 5'b00000;
		SW[3:1] <= 3'b000;
		SW[0] <= 0;
		@(posedge clk);
		
		// write to t2 memory
		SW[9] <= 0;
		SW[8:4] <= 5'b01000;
		SW[3:1] <= 3'b010;
		SW[0] <= 1;
		repeat (2) @(posedge clk);
		
		SW[9] <= 1;
		SW[8:4] <= 5'b01000;
		SW[3:1] <= 3'b010;
		SW[0] <= 0;
		repeat (2) @(posedge clk);
		
		// write to t3 memory
		SW[9] <= 1;
		SW[8:4] <= 5'b01010;
		SW[3:1] <= 3'b100;
		SW[0] <= 1;
		repeat (2) @(posedge clk);
		
		// cycle through t2 memory
		SW[9] <= 0;
		SW[8:4] <= 5'b00000;
		SW[3:1] <= 3'b000;
		SW[0] <= 0;
		repeat (16) @(posedge clk);
		$stop;
	end
endmodule
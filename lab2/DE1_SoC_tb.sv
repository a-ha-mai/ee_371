`timescale 1 ps / 1 ps

module DE1_SoC_tb ();
	logic CLOCK_50, clk;
	logic [3:0] KEY;
	logic [9:0] SW;
	logic [6:0] HEX0, HEX1, HEX4, HEX5;
	
	logic [2:0] DataIn, DataOut;
	logic [3:0] h0, h1, h4, h5;
	logic [4:0] Address;
	
	DE1_SoC dut2 (.CLOCK_50(clk), .KEY(KEY), .SW(SW), .HEX0(HEX), .HEX1(HEX1), .HEX4(HEX4), .HEX5(HEX5));
	task2 dut3 (.address(Address), .clk(clk), .reset(SW[9]), .data(DataIn), .wren(SW[0]), .q(DataOut));
	
	parameter CLOCK_PERIOD = 100;
	
	// initialize signals
	initial begin
		Address <= 0;
		DataIn <= 0;
		SW[0] <= 0;
		CLOCK_50 <= 0;
		forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50;
	end
	
	initial begin
		@(posedge CLOCK_50);
		KEY[0] <= 1;
		@(posedge CLOCK_50);
		KEY[0] <= 0;
		SW[9] <= 1;
		SW[8] <= 0;
		SW[7] <= 0;
		SW[6] <= 0;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 0;
		SW[2] <= 0;
		SW[1] <= 0;
		SW[0] <= 0;
		@(posedge CLOCK_50);
		SW[9] <= 0;
		@(posedge CLOCK_50);
		
		// write operation test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 0;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 1;
		SW[1] <= 1;
		SW[0] <= 1; // enable write operation
		repeat (2) @(posedge CLOCK_50);
		
		// read operation test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 0;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 1;
		SW[1] <= 1;
		SW[0] <= 0; // disable write operation
		repeat (2) @(posedge CLOCK_50);
		
		// changing Address test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 0;
		SW[5] <= 1;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 0;
		SW[1] <= 1;
		SW[0] <= 0;
		repeat (2) @(posedge CLOCK_50);
		
		// write test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 0;
		SW[5] <= 1;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 0;
		SW[1] <= 1;
		SW[0] <= 1;
		repeat (2) @(posedge CLOCK_50);
		
		// read test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 0;
		SW[5] <= 1;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 0;
		SW[1] <= 1;
		SW[0] <= 0;
		Address <= 2; 
		DataIn <= 1;
		repeat (2) @(posedge CLOCK_50);
		
		// changing Address test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 1;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 1;
		SW[1] <= 0;
		SW[0] <= 0;
		repeat (2) @(posedge CLOCK_50);
		
		// write test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 1;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 1;
		SW[1] <= 0;
		SW[0] <= 1;
		repeat (2) @(posedge CLOCK_50);
		
		// changing DataIn when write enabled test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 1;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 1; // set DataIn to be written
		SW[2] <= 0;
		SW[1] <= 1;
		SW[0] <= 1;
		repeat (2) @(posedge CLOCK_50);
		
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 1;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 1; // set DataIn to be written
		SW[2] <= 0;
		SW[1] <= 1;
		SW[0] <= 0;
		repeat (2) @(posedge CLOCK_50);
		
		// changing DataIn when write disabled test
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 1;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 1;
		SW[1] <= 0;
		SW[0] <= 0;
		repeat (2) @(posedge CLOCK_50);
		
		// check first Address
		SW[8] <= 0; // set Address for writing
		SW[7] <= 0;
		SW[6] <= 0;
		SW[5] <= 0;
		SW[4] <= 0;
		SW[3] <= 0; // set DataIn to be written
		SW[2] <= 0;
		SW[1] <= 0;
		SW[0] <= 0;
		repeat (2) @(posedge CLOCK_50);
		$stop;
	end
endmodule
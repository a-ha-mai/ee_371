module task1 (address, clk, data, wren, q);
	input [4:0] address;
	input clk, wren; // wren = [wr]ite [en]able
	input [2:0] data;
	output [2:0] q;
	
	ram32x3 ram (.address(address), .clock(clk), .data(data), .wren(wren), .q(q));
endmodule

`timescale 1 ps / 1 ps

module task1_tb ();
	logic [4:0] address;
	logic clk, wren;
	logic [2:0] data;
	logic [2:0] q;
	
	task1 dut (.address(address), .clk(clk), .data(data), .wren(wren), .q(q));
	
	parameter CLOCK_PERIOD = 100;
	
	// initialize signals
	initial begin
		address <= 0;
		data <= 0;
		wren <= 0;
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		@(posedge clk);
		
		// write operation test
		wren <= 1; // enable write operation
		address <= 0; // set address for writing
		data <= 3; // set data to be written
		repeat (2) @(posedge clk);
		
		// read operation test
		wren <= 0; // disable write operation
		address <= 0; // set address for reading
		data <= 3; 
		repeat (2) @(posedge clk);
		
		// changing address test
		wren <= 0;
		address <= 2;
		data <= 1;
		repeat (2) @(posedge clk);
		
		// write test
		wren <= 1;
		address <= 2; 
		data <= 1;
		repeat (2) @(posedge clk);
		
		// read test
		wren <= 0;
		address <= 2; 
		data <= 1;
		repeat (2) @(posedge clk);
		
		// changing address test
		wren <= 0;
		address <= 4; 
		data <= 2;
		repeat (2) @(posedge clk);
		
		// write test
		wren <= 1;
		address <= 4; 
		data <= 2;
		repeat (2) @(posedge clk);
		
		// changing data when write enabled test
		wren <= 1;
		address <= 4; 
		data <= 5;
		repeat (2) @(posedge clk);
		
		wren <= 0;
		address <= 4; 
		data <= 5;
		repeat (2) @(posedge clk);
		
		// changing data when write disabled test
		wren <= 0;
		address <= 4; 
		data <= 2;
		repeat (2) @(posedge clk);
		
		// check first address
		wren <= 0;
		address <= 0; 
		data <= 0;
		repeat (2) @(posedge clk);
		
		$stop;
	end
endmodule
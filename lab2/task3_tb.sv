`timescale 1 ps / 1 ps

module task3_tb ();
	logic [4:0] address;
	logic clk, reset, wren, select;
	logic [2:0] data;
	logic [2:0] q;
	
	task3 dut (.rdaddress(address), .wraddress(address), .clk(clk), .data(data), .wren(wren), .select(select), .q(q));
	
	parameter CLOCK_PERIOD = 100;
	
	// initialize signals
	initial begin
		address <= 0;
		data <= 0;
		wren <= 0;
		select <= 0;
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		@(posedge clk);
		
		reset <= 1;
		@(posedge clk);
		reset <= 0;
		@(posedge clk);
		
		// write operation no select test
		wren <= 1; // select write operation
		select <= 0;
		address <= 0; // set address for writing
		data <= 3; // set data to be written
		repeat (2) @(posedge clk);
		
		// write operation yes select test
		wren <= 1; // select write operation
		select <= 1;
		address <= 0; // set address for writing
		data <= 3; // set data to be written
		repeat (2) @(posedge clk);
		
		// read operation yes select test
		wren <= 0; // disable write operation
		select <= 1;
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
		
		// changing data when write selectd test
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
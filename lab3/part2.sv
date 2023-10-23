module part2 (CLOCK_50, reset, write, readdata);
	input logic CLOCK_50, reset, write;
	output logic [23:0] readdata;
	
	reg [14:0] address = 15'h0000;  // 18-bit address counter, initialize with 0

	// Increment address counter when writing to FPGA
	always @(posedge CLOCK_50) begin
		if (reset) begin
			address <= 15'h0000;
		end else if (write) begin
			address <= address + 1;
			if (address == 15'hBB80) begin
				address <= 15'h0000;
			end
		end
	end
	
	C4 tone (.address(address), .clock(CLOCK_50), .q(readdata));
endmodule
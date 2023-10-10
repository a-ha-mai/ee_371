`timescale 1 ps / 1 ps

// task2_augment functions similarly to task2, with some key differences. The augmented version
// implements simplified dual-port ram, which differs itself from task2 by having 2 separate
// 5-bit address inputs, one for the write address (wraddress) and one for the read
// address (rdaddress). The 1-bit select input determines if task3's memory is selected
// and if it'll be written to.
module task2_augment (rdaddress, wraddress, clk, reset, data, wren, select, q);
	logic [2:0] memory_array [31:0];
	
	input logic [4:0] rdaddress, wraddress;
	input logic clk, reset, wren, select; // wren = [wr]ite [en]able
	input logic [2:0] data;
	output logic [2:0] q;
	
	// If module is selected and write is enabled (wren), write data into memory_array at the
	// write address (wraddress). 
	// Output memory at the read address (rdaddress).
	// Sets all values of memory_array to 0 when reset.
	always_ff @(posedge clk) begin
		if (reset) begin
			integer i;
			for (i = 0; i < 32; i = i + 1) begin
				memory_array[i] = 3'b000; // Set your desired initial value here
			end
		end else begin
			if (wren & ~select) begin
				memory_array[wraddress] <= data;
				q <= memory_array[rdaddress];
				if (wraddress == rdaddress) begin
					memory_array[wraddress] <= data;
					q <= data;
				end
			end else begin
				q <= memory_array[rdaddress];
			end
		end
	end
endmodule

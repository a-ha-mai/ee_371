/* Register file module for specified data and address bus widths.
 * Asynchronous read port (r_addr -> r_data) and synchronous write
 * port (w_data -> w_addr if w_en).
 */
module reg_file #(parameter DATA_WIDTH=24, ADDR_WIDTH=3)
					  (clk, w_data, w_en, r_en, w_addr, r_addr, r_data);

	input  logic clk, w_en, r_en;
	input  logic [ADDR_WIDTH-1:0] w_addr, r_addr;
	input  logic [DATA_WIDTH-1:0] w_data;
	output logic [DATA_WIDTH-1:0] r_data;
	
	// array declaration (registers)
	logic [DATA_WIDTH-1:0] array_reg [0:2**ADDR_WIDTH-1];
	
	// write operation (synchronous)
	always_ff @(posedge clk)
		if (w_en)
			array_reg[w_addr] <= w_data;
	
	// read operation (asynchronous)
	assign r_data = r_en ? array_reg[r_addr] : 0;
	
endmodule  // reg_file
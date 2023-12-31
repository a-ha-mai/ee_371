/* FIFO buffer FWFT implementation for specified data and address
 * bus widths based on internal register file and FIFO controller.
 * Inputs: 1-bit rd removes head of buffer and 1-bit wr writes
 * w_data to the tail of the buffer.
 * Outputs: 1-bit empty and full indicate the status of the buffer
 * and r_data holds the value of the head of the buffer (unless empty).
 */
module fifo #(parameter DATA_WIDTH=24, ADDR_WIDTH=3)
            (clk, reset, rd, wr, empty, full, w_data, w_addr, r_data);

	input  logic clk, reset, rd, wr;
	output logic empty, full;
	input  logic [DATA_WIDTH-1:0] w_data;
	output logic [ADDR_WIDTH-1:0] w_addr;
	output logic [DATA_WIDTH-1:0] r_data;
	
	// signal declarations
	logic [ADDR_WIDTH-1:0] r_addr;
	logic w_en, r_en;
	
	// enable write only when FIFO is not full
	// or if reading and writing simultaneously
	assign w_en = wr & (~full | rd);
	assign r_en = wr & rd & full;
	
	// instantiate FIFO controller and register file
	fifo_ctrl #(ADDR_WIDTH) c_unit (.*);
	reg_file #(DATA_WIDTH, ADDR_WIDTH) r_unit (.*);
	
endmodule  // fifo

module fifo_tb ();
	parameter DATA_WIDTH = 24;
	parameter ADDR_WIDTH = 3;
	
	logic clk, reset, rd, wr, empty, full, w_en, r_en;
	logic [DATA_WIDTH-1:0] w_data, r_data;
	logic [ADDR_WIDTH-1:0] w_addr, r_addr;
	
	fifo #(DATA_WIDTH, ADDR_WIDTH) c_unit (.*);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		rd <= 0; wr <= 0; w_data <= 24'b0;
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		
		rd <= 1; wr <= 1; w_data <= 24'b1; repeat (16) @(posedge clk);
		$stop;
	end
endmodule // fifo_tb
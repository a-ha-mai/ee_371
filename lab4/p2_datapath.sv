`timescale 1 ps / 1 ps

module p2_datapath #(parameter DATA_WIDTH=8, ADDR_WIDTH=5)
					  (clk, A, reset_ptr, load_A, r_shift_m_ptr, set_l_ptr, data_in, data_out, m_ptr, loc);

	// port definitions
	input logic clk; // external inputs
	input logic [DATA_WIDTH-1:0] A;
	input logic reset_ptr, load_A, r_shift_m_ptr, set_l_ptr; // control signals
	output logic [DATA_WIDTH-1:0] data_in, data_out; // status signal
	output logic [ADDR_WIDTH-1:0] m_ptr;
	output logic [ADDR_WIDTH-1:0] loc; // external output
	
	logic [ADDR_WIDTH-1:0] l_ptr;
	assign loc = l_ptr + m_ptr;
	
	rom32x8 r_unit (.address(loc), .data_out(data_out));
	
	// datapath logic
	always_ff @(posedge clk) begin
		if (reset_ptr) begin 
			m_ptr <= 5'b10000; 
			l_ptr <= 5'b00000;
		end
		if (load_A) data_in <= A;
		if (r_shift_m_ptr) begin 
			m_ptr <= (m_ptr >> 1);
		end
		if (set_l_ptr) l_ptr <= l_ptr + m_ptr;
	end
endmodule // p2_datapath
`timescale 1 ps / 1 ps

module p2_controller #(parameter DATA_WIDTH=8, ADDR_WIDTH=5) 
						 (clk, reset, s, data_in, data_out, m_ptr, reset_ptr, load_A, r_shift_m_ptr, set_l_ptr, done, found);
	
	// port definitions
	input logic clk, reset, s; // external inputs
	input logic [DATA_WIDTH-1:0] data_in, data_out; // status signal
	input logic [ADDR_WIDTH-1:0] m_ptr;
	output logic reset_ptr, load_A, r_shift_m_ptr, set_l_ptr; // control signals
	output logic done, found; // external outputs
	
	// define state names and variables
	enum {S1, S2, S3, S4, S5} ps, ns;
	
	// controller logic w/synchronous reset
	always_ff @(posedge clk)
		if (reset) ps <= S1;
		else begin
			ps <= ns;
			case (ps)
				S1: ns = s ? S2 : S1;
				S2: begin
					if (data_in == data_out) ns = S4;
					else if (m_ptr == 0) ns = S3;
					else ns = S2;
				end
				S3: ns = s ? S3 : S1;
				S4: ns = s ? S4 : S1;
			endcase
		end	
	
	// output assignments (mealy)
	assign load_A = (ps == S1) & ~s;
	assign set_l_ptr = (ps == S2) & (m_ptr != 0) & (data_in > data_out);
	assign r_shift_m_ptr = (ps == S2) & (m_ptr != 0) & (data_in != data_out);
	
	// output assignments (moore)
	assign reset_ptr = (ps == S1);
	assign done = (ps == S3) | (ps == S4);
	assign found = (ps == S4);
endmodule // p2_controller
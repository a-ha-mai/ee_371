module controller #(parameter DATA_WIDTH=8) ();
	// ctrl signals: equal, greater/less than
	// external inputs: clk, reset, in, s
	
	// datapath: l_ptr, m_ptr, r_ptr, data_out
	// status signals: in
	// external inputs: clk, reset
	// external outputs: done, found
	
	// port definitions
	input logic clk, reset, s; // external inputs
	input logic [DATA_WIDTH-1:0] in;
	output logic reset_l_r_ptr, load_A, set_m_ptr, set_l_ptr, set_r_ptr, done;
endmodule
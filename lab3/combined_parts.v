module combined_parts (CLOCK_50, CLOCK2_50, KEY, SW, FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, 
		        AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT);

	input CLOCK_50, CLOCK2_50;
	input [0:0] KEY;
	input [9:0] SW;
	// I2C Audio/Video config interface
	output FPGA_I2C_SCLK;
	inout FPGA_I2C_SDAT;
	// Audio CODEC
	output AUD_XCK;
	input AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	input AUD_ADCDAT;
	output AUD_DACDAT;
	
	// Local wires.
	wire read_ready, write_ready, read, write;
	wire [23:0] readdata_left, readdata_right, readdata;
	wire [23:0] writedata_left, writedata_right;
	wire [23:0] intermediate_writedata_left, intermediate_writedata_right;
	wire reset = ~KEY[0];
	
	

	/////////////////////////////////
	// Your code goes here 
	/////////////////////////////////
	
	assign read = read_ready & write_ready;
	assign write = read_ready & write_ready; 
	
	part2 p2 (.CLOCK_50(CLOCK_50), .reset(reset), .write(write), .readdata(readdata));
	
	assign intermediate_writedata_left = SW[9] ? readdata : readdata_left;
	assign intermediate_writedata_right = SW[9] ? readdata : readdata_right;
	
	part3 p3_left (.clk(CLOCK_50), .reset(~KEY[0]), .write(write), .r_data(intermediate_writedata_left), .f_data(writedata_left)); 
	part3 p3_right (.clk(CLOCK_50), .reset(~KEY[0]), .write(write), .r_data(intermediate_writedata_right), .f_data(writedata_right)); 
		
/////////////////////////////////////////////////////////////////////////////////
// Audio CODEC interface. 
//
// The interface consists of the following wires:
// read_ready, write_ready - CODEC ready for read/write operation 
// readdata_left, readdata_right - left and right channel data from the CODEC
// read - send data from the CODEC (both channels)
// writedata_left, writedata_right - left and right channel data to the CODEC
// write - send data to the CODEC (both channels)
// AUD_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio CODEC
// I2C_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio/Video Config module
/////////////////////////////////////////////////////////////////////////////////
	clock_generator my_clock_gen(
		// inputs
		CLOCK2_50,
		reset,

		// outputs
		AUD_XCK
	);

	audio_and_video_config cfg(
		// Inputs
		CLOCK_50,
		reset,

		// Bidirectionals
		FPGA_I2C_SDAT,
		FPGA_I2C_SCLK
	);

	audio_codec codec(
		// Inputs
		CLOCK_50,
		reset,

		read,	write,
		writedata_left, writedata_right,

		AUD_ADCDAT,

		// Bidirectionals
		AUD_BCLK,
		AUD_ADCLRCK,
		AUD_DACLRCK,

		// Outputs
		read_ready, write_ready,
		readdata_left, readdata_right,
		AUD_DACDAT
	);

endmodule
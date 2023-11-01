module rom32x8 (address, data_out);
	input logic [4:0] address;
	output logic [7:0] data_out;
	
	logic [7:0] rom [31:0];
	
	initial begin
		$readmemh("rom32x8.mif", rom);
	end
	
	assign data_out = rom[address];
endmodule
module parking_lot_occupancy (V_GPIO, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	inout logic [35:0] V_GPIO;
	input logic CLOCK_50;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [4:0] car_count;
	
	assign V_GPIO[31] = V_GPIO[28]; // outer led indicator
	assign V_GPIO[33] = V_GPIO[29]; // inner led indicator
	
	car_counter(.reset(V_GPIO[30]), .clk(CLOCK_50), .outer(V_GPIO[28]), .inner(V_GPIO[29]), .car_count);
	
	always_comb begin
		case (car_count)
			5'b00000: begin
				HEX0 = 7'b0000001; // 0
				HEX1 = 7'b1111000; // R
				HEX2 = 7'b1100111; // A
				HEX3 = 7'b1011101; // E
				HEX4 = 7'b1001111; // L
				HEX5 = 7'b1100000; // C
			end
			5'b00001: begin
				HEX0 = 7'b1001111; // 1
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00010: begin
				HEX0 = 7'b0010010; // 2
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00011: begin
				HEX0 = 7'b0000110; // 3
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00100: begin
				HEX0 = 7'b1001100; // 4
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00101: begin
				HEX0 = 7'b0100100; // 5
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00110: begin
				HEX0 = 7'b0100000; // 6
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00111: begin
				HEX0 = 7'b0001111; // 7
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01000: begin
				HEX0 = 7'b0000000; // 8
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01001: begin
				HEX0 = 7'b0000100; // 9
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01010: begin
				HEX0 = 7'b0000001; // 0
				HEX1 = 7'b1001111; // 1
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01011: begin
				HEX0 = 7'b1001111; // 1
				HEX1 = 7'b1001111; // 1
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01100: begin
				HEX0 = 7'b0010010; // 2
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01101: begin
				HEX0 = 7'b0000110; // 3
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01110: begin
				HEX0 = 7'b1001100; // 4
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01111: begin
				HEX0 = 7'b0100100; // 5
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b10000: begin
				HEX0 = 7'b0100000; // 6
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1001111; // L
				HEX3 = 7'b1001111; // L
				HEX4 = 7'b1100110; // U
				HEX5 = 7'b1100000; // F
			end
			default: begin
				HEX0 = 7'b1111111;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
		endcase
	end
endmodule

module parking_lot_occupancy_tb ();
	wire [35:0] V_GPIO;
	logic [35:0] V_GPIO_in; 
	logic [35:0] V_GPIO_dir;
	logic CLOCK_50, clk;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	genvar i; 
	generate 
		for (i = 0; i < 36; i++) begin : gpio 
			assign V_GPIO[i] = V_GPIO_dir[i] ? V_GPIO_in[i] : 1'bZ; 
		end 
	endgenerate
	
	parking_lot_occupancy dut (.V_GPIO, .CLOCK_50, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		V_GPIO_dir[28]  = 1'b0;
      V_GPIO_dir[29]  = 1'b0;
		V_GPIO_dir[30]  = 1'b0;
		
		V_GPIO_dir[31]  = 1'b1;
      V_GPIO_dir[33]  = 1'b1;
	end
	
	initial begin
										repeat (1) @(posedge clk);
		V_GPIO_in[30] <= 1;
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[30] <= 0;					repeat (1) @(posedge clk);
		
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (3) @(posedge clk); // 1
		
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (3) @(posedge clk); // 2
		
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (3) @(posedge clk); // 1
		
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (3) @(posedge clk); // 0
		
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (3) @(posedge clk); // 0
		
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 1; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 1; repeat (1) @(posedge clk);
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (3) @(posedge clk); // 1
		$stop;
	end
endmodule
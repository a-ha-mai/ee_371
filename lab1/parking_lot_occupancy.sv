// The parking lot occupancy module is used to display the current occupancy
// rate of the parking lot on the HEX display. It uses an instance of the 
// car_counter module to get the car count by using switches as the sensors,
// and changes the HEX display based on this value using a combinational logic statement.
module parking_lot_occupancy (V_GPIO, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	inout logic [35:0] V_GPIO;
	input logic CLOCK_50;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [4:0] car_count;
		
	assign V_GPIO[31] = V_GPIO[28]; // outer led indicator
	assign V_GPIO[33] = V_GPIO[29]; // inner led indicator
	
	// Connect the signals as specified in the header comment.
	car_counter cc(.reset(V_GPIO[30]), .clk(CLOCK_50), .outer(V_GPIO[28]), .inner(V_GPIO[29]), .car_count);
	
	// This code showcases the combinational logic used in the HEX display.
	always_comb begin
		case (car_count)
			5'b00000: begin
						//  6543210
				HEX0 = 7'b1000000; // 0
				HEX1 = 7'b1001110; // R
				HEX2 = 7'b0001000; // A
				HEX3 = 7'b0000110; // E
				HEX4 = 7'b1000111; // L
				HEX5 = 7'b1000110; // C
			end
			5'b00001: begin
						//  6543210
				HEX0 = 7'b1001111; // 1
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00010: begin
						//  6543210
				HEX0 = 7'b0100100; // 2
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00011: begin
						//  6543210
				HEX0 = 7'b0110000; // 3
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00100: begin
						//  6543210
				HEX0 = 7'b0011001; // 4
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00101: begin
						//  6543210
				HEX0 = 7'b0010010; // 5
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00110: begin
						//  6543210
				HEX0 = 7'b0000010; // 6
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00111: begin
						//  6543210
				HEX0 = 7'b1111000; // 7
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01000: begin
						//  6543210
				HEX0 = 7'b0000000; // 8
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01001: begin
						//  6543210
				HEX0 = 7'b0010000; // 9
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01010: begin
				HEX0 = 7'b1000000; // 0
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
				HEX0 = 7'b0100100; // 2
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01101: begin
				HEX0 = 7'b0110000; // 3
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01110: begin
				HEX0 = 7'b0011001; // 4
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01111: begin
				HEX0 = 7'b0010010; // 5
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b10000: begin
						//  6543210
				HEX0 = 7'b0000010; // 6
				HEX1 = 7'b1001111; // 1;
				HEX2 = 7'b1000111; // L
				HEX3 = 7'b1000111; // L
				HEX4 = 7'b1000001; // U
				HEX5 = 7'b0001110; // F
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
	logic [4:0] car_count;
	
	genvar i; 
	generate 
		for (i = 0; i < 36; i++) begin : gpio 
			assign V_GPIO[i] = V_GPIO_dir[i] ? V_GPIO_in[i] : 1'bZ; 
		end 
	endgenerate
	
	// We instantiate the testbench with signals that we will set during testing.
	parking_lot_occupancy dut (.V_GPIO, .CLOCK_50, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);
	
	// We designate the clock period as 100 ms.
	parameter CLOCK_PERIOD = 100;
	
	// This loop creates a simple clock cycle.
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		V_GPIO_dir[28] = 1'b1;
		V_GPIO_dir[29] = 1'b1;
		V_GPIO_dir[30] = 1'b1;
		
		V_GPIO_dir[31] = 1'b0;
		V_GPIO_dir[33] = 1'b0;
	end
	
	initial begin
															 repeat (1) @(posedge clk);
		V_GPIO_in[30] <= 1;
		V_GPIO_in[28] <= 0; V_GPIO_in[29] <= 0; repeat (1) @(posedge clk);
		V_GPIO_in[30] <= 0;							 repeat (1) @(posedge clk);
		
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
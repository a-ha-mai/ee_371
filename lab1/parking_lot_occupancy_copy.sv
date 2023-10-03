module parking_lot_occupancy_copy (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input logic CLOCK_50;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [4:0] car_count;
	
	assign LEDR[0] = SW[0]; // outer led indicator
	assign LEDR[1] = SW[1]; // inner led indicator
	
	car_counter cc(.reset(SW[9]), .clk(CLOCK_50), .outer(SW[0]), .inner(SW[1]), .car_count);
	
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
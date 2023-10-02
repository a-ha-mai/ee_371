module car_counter (reset, clk, outer, inner, car_count);
	input logic reset, clk, outer, inner;
	output logic [4:0] car_count;
	logic enter, exit;
	logic [1:0] gate_sensors;
	
	car_detection cd(.reset, .clk, .outer, .inner, .enter, .exit);
	
	assign gate_sensors = {enter, exit};
	
	always_ff begin
		if (reset) begin
			car_count <= 5'b0;
		end
		else
			case (gate_sensors)
				2'b10:
					if (car_count <= 5'b10000) car_count <= car_count + 1;
				2'b01:
					if (car_count > 5'b0) car_count <= car_count - 1;
				default:
					car_count <= car_count;
			endcase
	end
endmodule

module car_counter_tb ();
	logic reset, clk, outer, inner, enter, exit;
	logic [4:0] car_count;
	
	car_counter dut (.reset(reset), .clk(clk), .outer(outer), .inner(inner), .car_count(car_count));
	
	parameter CLOCK_PERIOD = 100;
	
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
									  repeat (1) @(posedge clk);
		reset <= 1; 
		enter <= 0; exit <= 0; repeat (1) @(posedge clk);
		reset <= 1;				  repeat (1) @(posedge clk);
		
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 1
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 0; exit <= 1; repeat (1) @(posedge clk); // 0
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 0; exit <= 1; repeat (1) @(posedge clk); // 0
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 1
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 2
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 3
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 4
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 5
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 6
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 7
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 8
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 9
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 10
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 11
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 12
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 13
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 14
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 15
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 16
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 16
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 1; exit <= 0; repeat (1) @(posedge clk); // 16
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		enter <= 0; exit <= 1; repeat (1) @(posedge clk); // 15
		enter <= 0; exit <= 0; repeat (3) @(posedge clk);
		$stop;
	end
endmodule

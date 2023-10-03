module car_counter (reset, clk, outer, inner, car_count);
	input logic reset, clk, outer, inner;
	output logic [4:0] car_count;
	logic enter, exit;
	
	car_detection cd(.reset, .clk, .outer, .inner, .enter, .exit);
	
	always_ff @(posedge clk) begin
		if (reset) begin
			car_count <= 5'b0;
		end
		else begin
			if (enter && car_count < 5'b10000) car_count <= car_count + 1'b1;
			else if (exit && car_count > 5'b0) car_count <= car_count - 1'b1;
		end
	end
endmodule

module car_counter_tb ();
	logic reset, clk, outer, inner, enter, exit;
	logic [4:0] car_count;
	
	car_counter dut (.reset, .clk, .outer, .inner, .car_count);
	
	parameter CLOCK_PERIOD = 100;
	
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
										repeat (1) @(posedge clk);
		reset <= 1;
		outer <= 0; inner <= 0; repeat (1) @(posedge clk);
		reset <= 0;					repeat (1) @(posedge clk);
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 1
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 2
		
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 1
		
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 0
		
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 0
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 1
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 2
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 3
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 4
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 5
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 6
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 7
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 8
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 9
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 10
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 11
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 12
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 13
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 14
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 15
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 16
		
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // 16
		
		outer <= 0; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 1; repeat (1) @(posedge clk);
		outer <= 1; inner <= 0; repeat (1) @(posedge clk);
		outer <= 0; inner <= 0; repeat (9) @(posedge clk); // 15
		
		$stop;
	end
endmodule

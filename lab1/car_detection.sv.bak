module car_detection (reset, clk, outer, inner, enter, exit);
	input logic reset, clk, outer, inner;
	output logic enter, exit;
	
	enum { no_car, maybe_entering, maybe_exiting, is_entering, is_exiting, finishing_entering, finishing_exiting, done_entering, done_exiting } ps, ns;

	always_comb begin
		case (ps)
			no_car:
				if (outer & ~inner)		 ns = maybe_entering;
				else if (~outer & inner) ns = maybe_exiting;
				else 							 ns = no_car;
			maybe_entering:
				if (outer & inner)		 ns = is_entering;
				else if (outer & ~inner) ns = maybe_entering;
				else							 ns = no_car;
			is_entering:
				if (~outer & inner)		 ns = finishing_entering;
				else if (outer & inner)  ns = is_entering;
				else if (outer & ~inner) ns = maybe_entering;
				else 							 ns = no_car;
			finishing_entering:
				if (~outer & inner)		 ns = finishing_entering;
				else if (outer & inner)  ns = is_entering;
				else if (outer & ~inner) ns = no_car;
				else							 ns = done_entering;
			maybe_exiting:
				if (outer & inner)		 ns = is_exiting;
				else if (~outer & inner) ns = maybe_exiting;
				else 							 ns = no_car;
			is_exiting:
				if (outer & ~inner)		 ns = finishing_exiting;
				else if (outer & inner)  ns = is_exiting;
				else if (~outer & inner) ns = maybe_exiting;
				else 							 ns = no_car;
			finishing_exiting:
				if (outer & ~inner)		 ns = finishing_exiting;
				else if (outer & inner)  ns = is_exiting;
				else if (~outer & inner) ns = no_car;
				else							 ns = done_exiting;
			done_entering, done_exiting:
				ns = no_car;
		endcase
	end
	
	always_ff @(posedge clk) begin
		if (reset) begin
			ps <= no_car;
		end
		else begin
			ps <= ns;
			case (ps)
				done_entering:
					enter <= 1'b1;
				default:
					enter <= 1'b0;
			endcase
			case (ps)
				done_exiting:
					exit <= 1'b1;
				default:
					exit <= 1'b0;
			endcase
		end
	end
endmodule

module car_detection_tb();
	logic reset, clk, outer, inner, exit, enter;
	
	car_detection dut (.reset, .clk, .outer, .inner, .exit, .enter);
	
	parameter CLOCK_PERIOD = 100;
	
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		repeat (1) @(posedge clk);
		reset <= 1; 
		outer <= 0; inner <= 0; repeat (1) @(posedge clk); // no car
		reset <= 0; 				repeat (1) @(posedge clk);
		
		// no_car cases
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // no_car
		outer <= 1; inner <= 1; repeat (3) @(posedge clk); // no_car
		
		// maybe_entering cases
		outer <= 1; inner <= 0; repeat (3) @(posedge clk); // maybe_entering
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // no_car
		outer <= 1; inner <= 0; repeat (3) @(posedge clk); // maybe_entering
		outer <= 0; inner <= 1; repeat (1) @(posedge clk); // no_car
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // no_car
		outer <= 1; inner <= 0; repeat (3) @(posedge clk); // maybe_entering
		
		// is_entering cases
		outer <= 1; inner <= 1; repeat (3) @(posedge clk); // is_entering
		outer <= 1; inner <= 0; repeat (3) @(posedge clk); // maybe_entering
		outer <= 1; inner <= 1; repeat (3) @(posedge clk); // is_entering
		outer <= 0; inner <= 0; repeat (3) @(posedge clk); // no_car
		outer <= 1; inner <= 0; repeat (3) @(posedge clk); // maybe_entering
		outer <= 1; inner <= 1; repeat (3) @(posedge clk); // is_entering
		
		// finishing_entering
		outer <= 0; inner <= 1; repeat (3) @(posedge clk); // finishing_entering
		outer <= 1; inner <= 0; repeat (3) @(posedge clk); // no_car
		outer <= 1; inner <= 0; repeat (3) @(posedge clk); // maybe_entering
		outer <= 1; inner <= 1; repeat (3) @(posedge clk); // is_entering
		outer <= 0; inner <= 1; repeat (3) @(posedge clk); // finishing_entering
		outer <= 1; inner <= 1; repeat (3) @(posedge clk); // is entering
		outer <= 0; inner <= 1; repeat (3) @(posedge clk); // finishing_entering
		outer <= 0; inner <= 0; repeat (5) @(posedge clk); // no car + enter signal
		$stop;
	end
endmodule
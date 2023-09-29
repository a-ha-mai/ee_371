module car_detection (reset, clk, outer, inner, enter, exit);
	input logic reset, clk, outer, inner;
	output logic enter, exit;
	
	enum { no_car, maybe_entering, maybe_exiting, is_entering, is_exiting, finish_entering, finish_exiting, done_entering, done_exiting } ps, ns;

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
				if (~outer & inner)		 ns = finish_entering;
				else if (outer & inner)  ns = is_entering;
				else if (outer & ~inner) ns = maybe_entering;
				else 							 ns = no_car;
			finish_entering:
				if (outer & ~inner)		 ns = finish_entering;
				else if (outer & inner)  ns = is_entering;
				else if (~outer & inner) ns = no_car;
				else							 ns = done_entering;
			maybe_exiting:
				if (outer & inner)		 ns = is_exiting;
				else if (~outer & inner) ns = maybe_exiting;
				else 							 ns = no_car;
			is_exiting:
				if (outer & ~inner)		 ns = finish_exiting;
				else if (outer & inner)  ns = is_exiting;
				else if (~outer & inner) ns = maybe_exiting;
				else 							 ns = no_car;
			finish_exiting:
				if (~outer & inner)		 ns = finish_exiting;
				else if (outer & inner)  ns = is_exiting;
				else if (outer & ~inner) ns = no_car;
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
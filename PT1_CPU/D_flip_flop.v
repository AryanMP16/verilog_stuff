module d_latch (input d, input enable, output q, output not_q);
	wire nand_1_out, nand_2_out;

	assign nand_1_out = ~(d & enable);
	assign nand_2_out = ~(~d & enable);

	assign q = ~(nand_1_out & not_q);
	assign not_q = ~(nand_2_out & q);

endmodule : d_latch

module d_flip_flop (input d, input clk, output q, output not_q);
	wire q_master, not_q_master;

	d_latch master (.d(d), .enable(~clk), .q(q_master), .not_q(not_q_master));
	d_latch slave (.d(q_master), .enable(clk), .q(q), .not_q(not_q));

endmodule : d_flip_flop

module d_flip_flop_testbench;
	wire stored_value, nq, clock_signal;
	reg d;
	integer count;
	clock c(.signal(clock_signal));
	d_flip_flop dff(.d(d), .clk(clock_signal), .q(stored_value), .not_q(nq));
	
	initial begin
		$display("Time\tClk\tD\tStored Value");
		for (count = 0; count < 10; count = count + 1) begin
			d = (count/2) % 2; #5;
			$display("%0t\t%b\t%b\t%b", $time, clock_signal, d, stored_value);
		end

		$finish;
	end
endmodule : d_flip_flop_testbench

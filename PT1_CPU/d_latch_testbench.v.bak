module d_latch_testbench;
	reg d, enable;
	wire q;

	d_latch dl_dut(.d(d), .enable(enable), .q(q));

	initial begin
		$display("Time\tD\tEnable\tQ");

		d = 0; enable = 1; #5;
		$display("%0t\t%b\t%b\t%b", $time, d, enable, q);

		d = 1; enable = 1; #5;
		$display("%0t\t%b\t%b\t%b", $time, d, enable, q);

		d = 0; enable = 1; #5;
		$display("%0t\t%b\t%b\t%b", $time, d, enable, q);

		d = 1; enable = 0; #5;
		$display("%0t\t%b\t%b\t%b", $time, d, enable, q);

		d = 0; enable = 0; #5;
		$display("%0t\t%b\t%b\t%b", $time, d, enable, q);

		$finish;
	end
endmodule : d_latch_testbench
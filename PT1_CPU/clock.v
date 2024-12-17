module clock (output reg signal);
	initial begin
		signal = 0;
		forever #5 signal = ~signal;
	end
endmodule : clock

module clock_test;
	wire signal;
	integer count;

	clock c(.signal(signal));
	initial begin
		$display("Clock signal: ");
		#1;
		for (count = 0; count < 100; count = count + 1) begin
			$monitor("%b", signal);
			#5;
		end
		$finish;
	end
endmodule : clock_test
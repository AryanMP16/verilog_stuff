module clock (output signal);
	reg clk;
	assign signal = 0;
	initial begin
		assign clk = signal;
		forever #5 clk = ~clk;
	end
endmodule : clock

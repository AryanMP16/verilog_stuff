module d_latch (input d, input enable, output q, output not_q);
	wire nand_1_out, nand_2_out;

	assign nand_1_out = ~(d & enable);
	assign nand_2_out = ~(~d & enable);

	assign q = ~(nand_1_out & not_q);
	assign not_q = ~(nand_2_out & q);

endmodule : d_latch


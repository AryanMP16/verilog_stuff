module register_16bit (input [15 : 0] I, input clk, input load, output [15 : 0] Q, output [15 : 0] not_Q); //Designed with parallel load
	genvar i;
	generate
		for (i = 15; i >= 0; i = i - 1) begin
			d_flip_flop dff(.d((Q[i] & ~load) | (I[i] & load)), .clk(clk), .q(Q[i]), .not_q(not_Q[i]));
		end
	endgenerate
endmodule : register_16bit
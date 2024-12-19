module MUX_2_1_16bit (input [31 : 0] signals, input select, output [15 : 0] sig_out);
	assign sig_out = (~select & signals[15 : 0]) | (select & signals[31 : 16]);
endmodule : MUX_2_1_16bit

module register_file (input [4 : 0] read_address/*if msb = 1, read data; otherwise RT*/, input [3 : 0] write_address, input [15 : 0] data_in, input clk, output [255 : 0] outs);
	wire read_data;
	wire [15 : 0] load;
	wire [15 : 0] inps;
	wire [15 : 0] intermediates;
	assign read_data = read_address[4]; //msb is read data
	
	//create registers
	genvar i;
	generate
		for (i = 15; i >= 0; i = i - 1) begin : reg_gen
			register_16bit r(/*input [15 : 0]*/ .I(inp[i]), /*input*/ .clk(clk), /*input*/ .load(load[i]), /*output [15 : 0]*/ .Q(outs[i * 16 + 15 : i * 16],
			 /*output [15 : 0]*/ .not_Q());
		end
	endgenerate

	MUX_4_to_16_16width mux1(/*input [3 : 0]*/ .s(read_address [3 : 0]), /*input [255 : 0]*/ .data_bus_in(outs), /*output [15 : 0]*/ .data_out(intermediates));

	wire [31 : 0] inp_to_2_1_mux;
	assign inp_to_2_1_mux [31 : 16] = data_in;
	assign inp_to_2_1_mux [15 : 0] = intermediates;

	MUX_2_1_16bit mux2(.signals(inp_to_2_1_mux), .select(read_data), .sig_out(inp));

endmodule : register_file

	

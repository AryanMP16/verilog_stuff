module MUX_4_to_16_16width (input [3 : 0] s, input [255 : 0] data_bus_in, output [15 : 0] data_out);
	genvar i, j;
	wire [15 : 0] decoder_output;
	wire [0 : 15] data_bus_pre_or [15 : 0];

	decoder_4_16 dec(.s(s), .out(decoder_output));

	generate
		for (i = 0; i <= 15; i = i + 1) begin : and_gates
			for (j = 15; j >= 0; j = j - 1) begin : individual_bits
				assign data_bus_pre_or[i][j] = decoder_output[i] & data_bus_in[i * 16 + j];
			end
		end
	endgenerate

	generate
		for (j = 15; j >= 0; j = j - 1) begin : reduce_or
			assign data_out[j] = |{data_bus_pre_or[0][j], data_bus_pre_or[1][j], data_bus_pre_or[2][j],
							data_bus_pre_or[3][j], data_bus_pre_or[4][j], data_bus_pre_or[5][j], 
							data_bus_pre_or[6][j], data_bus_pre_or[7][j], data_bus_pre_or[8][j], 
							data_bus_pre_or[9][j], data_bus_pre_or[10][j], data_bus_pre_or[11][j], 
							data_bus_pre_or[12][j], data_bus_pre_or[13][j], data_bus_pre_or[14][j], 
							data_bus_pre_or[15][j]};
		end
	endgenerate
endmodule : MUX_4_to_16_16width
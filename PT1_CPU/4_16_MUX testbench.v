module MUX_testbench;
	reg [255 : 0] inp;
	reg [3 : 0] select;
	wire [0 : 15] out;
	integer i, j;

	MUX_4_to_16_16width mux(.s(select), .data_bus_in(inp), .data_out(out));

	initial begin
		inp = 256'b0111010001101000011001010101111101110001011101010110100101100011011010110010011001100010011100100110111101110111011011100010100001100110011011110111100000101001011010100111010101101101011100000111001100101011011011110111011001100101011100100010110101110100;
		$display ("%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b", inp[15 : 0], inp[31 : 16], inp[47 : 32], inp[63 : 48], inp[79 : 64], inp[95 : 80], inp[111 : 96], inp[127 : 112], inp[143 : 128], inp[159 : 144], inp[175 : 160], inp[191 : 176], inp[207 : 192], inp[223 : 208], inp[239 : 224], inp[255 : 240]);
		$display ("Time\tSelect\tOutput\tExpected output");
		for (i = 0; i < 16; i = i + 1) begin : monitor
			select = i; #10;
			$display ("%0t\t%b\t%b",
				$time, select, out);
		end
	$finish;
	end
endmodule : MUX_testbench

module register_testbench;
    reg [15 : 0] inp;
    reg [15 : 0] prev_out;
    wire [15 : 0] out;
    reg load;
    wire clock_signal;

    clock c(.signal(clock_signal));
    register_16bit dut (.I(inp), .clk(clock_signal), .load(load), .Q(out), .not_Q());

    integer num;

    initial begin
        $display("Time\tClk\tLoad\tInput\tStored value");
        prev_out = 16'b0;
        
        for (num = 0; num < 1000; num = num + 1) begin
            inp = num[15 : 0]; 
            load = num % 2; 
            #10;
            
            $display("%0t\t%b\t%b\t%b\t%b", $time, clock_signal, load, inp, out);
            if (num > 0) begin
                if (load == 1) begin
                    prev_out = out;
                end else begin
                    if (prev_out != out) begin
                        $display("ASSERT FAILED: %b != %b", prev_out, out);
                        $stop;
                    end
                end
            end
        end
        
        $display("Passed all tests");
        $finish;
    end
endmodule : register_testbench
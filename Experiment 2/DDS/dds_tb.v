`timescale 1ns/1ns

module dds_tb;
    reg clk;
    reg rst;
    reg enable;

    wire [7:0] out;

    top_module_dds uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .out(out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1;
        enable = 0;

        #20;
        rst = 0;
        enable = 1;

        #20000;
        $stop;
    end

endmodule
`timescale 1ns/1ns

module freq_tb;
    reg clk;
    reg rst;
    reg init;
    reg h_l;
    reg [2:0] cnt1;
    reg [2:0] cnt2;

    wire out_to_dds;
    wire out_to_mp;

    top_module_freq uut (
        .clk(clk),
        .rst(rst),
        .init(init),
        .h_l(h_l),
        .cnt1(cnt1),
        .cnt2(cnt2),
        .out_to_dds(out_to_dds),
        .out_to_mp(out_to_mp)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1;
        cnt1 = 3'b000;
        cnt2 = 3'b000;

        #20;
        rst = 0;
        init = 1;

        #20;
        init = 0;
        h_l = 1;

        #30000;
        h_l = 0;

        #30000;
        $stop;
    end

endmodule
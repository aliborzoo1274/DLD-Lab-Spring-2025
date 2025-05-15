`timescale 1ns/1ns

module tb_controller_onepulser;

    reg clk, rst, clkpb;
    wire clken;

    controller_onepulser uut (
        .clkpb(clkpb),
        .rst(rst),
        .clk(clk),
        .clken(clken)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        clkpb = 0;

        #15 rst = 0;

        #10 clkpb = 1;
        #20 clkpb = 1;
        #20 clkpb = 0;
        #20 clkpb = 1;
        #20 clkpb = 1;
        #20 clkpb = 1;
        #20 clkpb = 0;

        #20 $stop;
    end

endmodule
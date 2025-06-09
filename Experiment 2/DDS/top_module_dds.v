module top_module_dds(
    input clk,
    input rst,
    output [7:0] out
);

    wire [5:0] addr;
    wire pp;
    wire sb;
    wire co;

    datapath_dds datapath(
        .addr(addr),
        .pp(pp),
        .sb(sb),
        .out(out)
    );

    controller_dds controller(
        .clk(clk),
        .rst(rst),
        .co(co),
        .pp(pp),
        .sb(sb)
    );

    counter_6b counter(
        .clk(clk),
        .rst(rst),
        .co(co),
        .addr(addr)
    );

endmodule
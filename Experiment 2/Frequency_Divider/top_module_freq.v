module top_module_freq (
    input clk,
    input rst,
    input init,
    input h_l,
    input [2:0] cnt1,
    input [2:0] cnt2,
    output out_to_dds,
    output out_to_mp
);

    wire co_from_2;

    freq_div freq_1 (
        .clk(clk),
        .rst(rst),
        .init(init),
        .h_l(1'b1),
        .cnt(cnt1),
        .co(out_to_mp)
    );

    freq_div freq_2 (
        .clk(clk),
        .rst(rst),
        .init(init),
        .h_l(1'b0),
        .cnt(cnt2),
        .co(co_from_2)
    );

    mux2to1 m1 (
        .in0(co_from_2),
        .in1(out_to_mp),
        .sel(h_l),
        .out(out_to_dds)
    );

endmodule
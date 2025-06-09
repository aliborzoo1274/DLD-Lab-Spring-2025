module top1 (
    input clk,
    input rst,
    input mode,
    input init,
    input [2:0] cnt1,
    input [2:0] cnt2,
    input send,
    input [4:0] msg,
    output wire [7:0] to_pwm
);

    wire to_dds;
    wire to_mp;
    wire [7:0] dds_to_mux;
    wire ser_out;
    wire or_out;

    top_module_dds dds(
        .clk(to_dds),
        .rst(rst),
        .out(dds_to_mux)
    );

    top_module_freq freq_div(
        .clk(clk),
        .rst(rst),
        .init(init),
        .h_l(ser_out),
        .cnt1(cnt1),
        .cnt2(cnt2),
        .out_to_dds(to_dds),
        .out_to_mp(to_mp)
    );

    top_module_mp mp(
        .clk(to_mp),
        .rst(rst),
        .send(send),
        .msg(msg),
        .ser_out(ser_out)
    );

    mux2to1_8b mux(
        .in0(8'd128),
        .in1(dds_to_mux),
        .sel(or_out),
        .out(to_pwm)
    );

    assign or_out = mode | ser_out;

endmodule
module top2 (
    input clk,
    input rst,
    input mode,
    input init,
    input [2:0] cnt,
    input send,
    input [4:0] msg,
    output wire out
);

    wire [7:0] to_pwm;

    top1 top1(
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .init(init),
        .cnt1(cnt),
        .cnt2(cnt),
        .send(send),
        .msg(msg),
        .to_pwm(to_pwm)
    );

    pwm pwm(
        .clk(clk),
        .rst(rst),
        .in(to_pwm),
        .out(out)
    );

endmodule
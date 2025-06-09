module top_module_mp (
    input clk,
    input rst,
    input send,
    input [4:0] msg,
    output ser_out, valid
);

    wire co2;
    wire en1;
    wire ld;
    wire co1;

    controller_mp ctrl (
        .clk(clk),
        .rst(rst),
        .send(send),
        .co2(co2),
        .en1(en1),
        .ld(ld),
        .valid(valid)
    );

    counter_4b counter4b (
        .clk(clk),
        .rst(rst),
        .en2(co1),
        .co2(co2)
    );

    counter_10b counter10b (
        .clk(clk),
        .rst(rst),
        .en1(en1),
        .co1(co1)
    );

    sh_reg_mp sh_reg (
        .clk(clk),
        .rst(rst),
        .ld(ld),
        .msg(msg),
        .shift(co1),
        .ser_out(ser_out)
    );

endmodule
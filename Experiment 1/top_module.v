module top_module(
    input clk,
    input rst,
    input ser_in,
    input clkpb,
    output [3:0] LEDR,
    output [1:0] LEDG,
    output [6:0] HEX0,
    output [6:0] HEX1
);

    wire clken;
    wire sh_en;
    wire cnt1;
    wire shend;
    wire ldcntd;
    wire cntd;
    wire cnt2;
    wire co1;
    wire cod;
    wire co2;

    controller_onepulser op (
        .clkpb(clkpb),
        .rst(rst),
        .clk(clk),
        .clken(clken)
    );

    datapath dp (
        .clk(clk),
        .clken(clken),
        .rst(rst),
        .ser_in(ser_in),
        .sh_en(sh_en),
        .cnt1(cnt1),
        .shend(shend),
        .ldcntd(ldcntd),
        .cntd(cntd),
        .cnt2(cnt2),
        .co1(co1),
        .p(LEDR),
        .cod(cod),
        .co2(co2),
        .up(HEX1),
        .low(HEX0)
    );

    controller cu (
        .clk(clk),
        .clken(clken),
        .rst(rst),
        .co1(co1),
        .co2(co2),
        .cod(cod),
        .serin(ser_in),
        .cnt1(cnt1),
        .cnt2(cnt2),
        .cntd(cntd),
        .ldcntd(ldcntd),
        .shen(sh_en),
        .shend(shend),
        .serout_valid(LEDG[0]),
        .done(LEDG[1])
    );

endmodule
module top_module(
    input clk,
    input rst,
    input ser_in,
    input clkpb,
    output reg [3:0] LEDR,
    output reg [1:0] LEDG,
    output reg [1:0] HEX
);

    wire sh_en;
    wire cnt1;
    wire sh_en;
    wire cnt1

    datapath dp (
        .clk(clk),
        .rst(rst),
        .ser_in(ser_in),
        .sh_en,
        .cnt1,
        .shend,
        .ldcntd,
        .cntd,
        .cnt2,
        .co1,
        .p(LEDR),
        .cod,
        .co2,
        .up(HEX[1]),
        .low(HEX[0])
    )
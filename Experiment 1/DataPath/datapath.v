module datapath (
    input clk,
    input clken,
    input rst,
    input ser_in,
    input sh_en,
    input cnt1,
    input shend,
    input ldcntd,
    input cntd,
    input cnt2,
    output co1,
    output [3:0] p,
    output cod,
    output co2,
    output [6:0] up,
    output [6:0] low
);

    wire [1:0] pn;
    wire [4:0] dn;
    wire [4:0] ssd;

    port_num_sr pns (
        .clk(clk),
        .clken(clken),
        .reset(rst),
        .ser_in(ser_in),
        .sh_en(sh_en),
        .q(pn)
    );

    port_num_cnt pnc (
        .clk(clk),
        .clken(clken),
        .reset(rst),
        .cnt1(cnt1),
        .co1(co1)
    );

    data_num_sr dns (
        .clk(clk),
        .clken(clken),
        .reset(rst),
        .ser_in(ser_in),
        .shend(shend),
        .q(dn)
    );

    data_num_cnt dnc (
        .clk(clk),
        .clken(clken),
        .reset(rst),
        .cnt2(cnt2),
        .co2(co2)
    );

    data_trans_cnt dtc (
        .clk(clk),
        .clken(clken),
        .reset(rst),
        .ldcntd(ldcntd),
        .cntd(cntd),
        .cod(cod),
        .data_num(dn),
        .q(ssd)
    );

    demux dmx (
        .port_num(pn),
        .ser_in(ser_in),
        .p(p)
    );

    Seven_Segment ss1 (
        .count(ssd[3:0]),
        .SSD(low)
    );

    
    Seven_Segment ss2 (
        .count({3'b000, ssd[4]}),
        .SSD(up)
    );

endmodule
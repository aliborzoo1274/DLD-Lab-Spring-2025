module datapath (
    input clk,
    input rst,
    input ser_in,
    input sh_en,
    input cnt1,
    input shend,
    input ldcntd,
    input cntd,
    input cnt2,
    output reg co1,
    output reg [3:0] p,
    output reg cod,
    output reg co2,
    output reg [6:0] up,
    output reg [6:0] low
);

    wire [1:0] pn;
    wire [4:0] dn;
    wire [4:0] ssd;

    port_num_sr pns (
        .clk(clk),
        .reset(rst),
        .ser_in(ser_in),
        .sh_en(sh_en),
        .q(pn)
    );

    port_num_cnt pnc (
        .clk(clk),
        .reset(rst),
        .cnt1(cnt1),
        .co1(co1)
    );

    data_num_sr dns (
        .clk(clk),
        .reset(rst),
        .ser_in(ser_in),
        .shend(shend),
        .q(dn)
    );

    data_num_cnt dnc (
        .clk(clk),
        .reset(rst),
        .cnt2(cnt2),
        .co2(co2)
    );

    data_trans_cnt (
        .clk(clk),
        .reset(rst),
        .ldcntd(ldcntd),
        .cntd(cntd),
        .cod(cod),
        .data_num(dn),
        .q(ssd)
    );

    demux demux (
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
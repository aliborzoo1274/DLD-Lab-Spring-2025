module datapath_dds (
    input [5:0] addr,
    input pp,
    input sb,
    output [7:0] out
);

    wire [5:0] addr_mux;
    wire [5:0] twos_comp_out;
    wire [7:0] rom_out;
    wire [7:0] sm_in;
    wire and_out;
    wire nor_out;

    sin_rom sr (
        .addr(addr_mux),
        .rom_out(rom_out)
    );

    twos_comp tc (
        .in(addr),
        .out(twos_comp_out)
    );

    mux2to1_6b m1 (
        .in0(addr),
        .in1(twos_comp_out),
        .sel(pp),
        .out(addr_mux)
    );

    sm_to_twos stt (
        .control(sb),
        .in(sm_in),
        .out(out)
    );

    mux2to1_8b m2 (
        .in0(rom_out),
        .in1(8'b11111111),
        .sel(and_out),
        .out(sm_in)
    );

    assign nor_out = ~|addr;
    assign and_out = nor_out & pp;

endmodule
module sin_rom (
    input [5:0] addr,
    output [7:0] rom_out
);

    reg [7:0] LUT [0:63];

    initial begin
        $readmemb("sine.mem", LUT);
    end

    //(* romstyle = "M9K" *)(* ram_init_file = "sine.mif" *) reg [7:0] LUT [0:63];

    assign rom_out = LUT[addr];

endmodule
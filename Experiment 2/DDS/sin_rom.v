module sin_rom (
    input [5:0] addr,
    output [7:0] rom_out
);

    reg [7:0] LUT [0:63];

    initial begin
        $readmemb("sine.mem.txt", LUT);
    end

    assign rom_out = LUT[addr];

endmodule
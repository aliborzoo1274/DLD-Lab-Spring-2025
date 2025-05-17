module twos_comp (
    input wire [5:0] in,
    output wire [5:0] out
);

    assign out = ~in + 6'b000001;

endmodule
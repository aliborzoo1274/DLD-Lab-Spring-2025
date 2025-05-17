module mux2to1_8b (
    input wire [7:0] in0,
    input wire [7:0] in1,
    input wire sel,
    output wire [7:0] out
);

    assign out = sel ? in1 : in0;

endmodule
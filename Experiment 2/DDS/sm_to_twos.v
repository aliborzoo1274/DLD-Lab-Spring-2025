module sm_to_twos (
    input wire control,
    input wire [7:0] in,
    output [7:0] out
);

    assign out = control ? in : ~in + 8'b00000001;

endmodule
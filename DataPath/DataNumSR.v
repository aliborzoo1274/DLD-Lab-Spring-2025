module data_num_sr (
    input clk,
    input reset,
    input sh_en,
    input ser_in,
    output reg [4:0] q
);

    always @(posedge clk)
    begin
        if (reset)
            q <= 5'b00000;
        else if (sh_en)
            q <= {q[0], q[1], q[2], q[3], ser_in};
    end

endmodule
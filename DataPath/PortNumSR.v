module port_num_sr (
    input clk,
    input reset,
    input sh_en,
    input ser_in,
    output reg [1:0] q
);

    always @(posedge clk)
    begin
        if (reset)
            q <= 2'b00;
        else if (sh_en)
            q <= {q[0], ser_in};
    end

endmodule
module port_num_cnt (
    input clk,
    input reset,
    input cnt1,
    output co1
);

    reg [1:0] q;
    assign co1 = (q == 2'b01);

    always @(posedge clk) begin
        if (reset)
            q <= 2'b00;
        else if (cnt1)
            q <= q + 1;
    end
endmodule
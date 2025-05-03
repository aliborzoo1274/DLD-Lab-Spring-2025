module data_num_cnt (
    input clk,
    input reset,
    input cnt2,
    output co2
);

    reg [2:0] q;
    assign co2 = q == 2'b100;

    always @(posedge clk) begin
        if (reset)
            q <= 2'b00;
        else if (cnt2)
            q <= q + 1;
    end
endmodule
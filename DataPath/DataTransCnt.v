module data_trans_cnt (
    input clk,
    input reset,
    input cntd,
    input ldcntd,
    input [4:0] data_num,
    output reg [4:0] q,
    output cod
);

assign cod = (q == 5'b00000);

always @(posedge clk) begin
    if (reset)
        q <= 5'b11111;
    else if (ldcntd)
        q <= data_num;
    else if (cntd)
        q <= q - 1;
end

endmodule
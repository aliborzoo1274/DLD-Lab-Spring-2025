module freq_div(
    input clk,
    input rst,
    input init,
    input h_l,
    input [2:0] cnt,
    output co
);

    reg [8:0] count;

    always @(posedge clk, posedge rst) begin
    
        if (rst)
            count <= 9'b000000000;
        else if (init)
            count <= {h_l, cnt, 5'b00000};
        else if (count == 9'b111111111)
            count <= {h_l, cnt, 5'b00000};
        else
            count <= count + 1;
    end

    assign co = &count;

endmodule
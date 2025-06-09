module counter_10b (
    input wire clk,
    input wire rst,
    input wire en1,
    output co1
);

    reg [9:0] count;

    always @(posedge clk, posedge rst) begin
    
        if (rst)
            count <= 10'b0000000000;
        else if (en1) begin
            if (count == 10'b1111111111)
                count <= 10'b0000000000;
            else
                count <= count + 1;
        end
    end

    assign co1 = &count;

endmodule
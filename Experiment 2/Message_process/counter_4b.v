module counter_4b (
    input wire clk,
    input wire rst,
    input wire en2,
    output co2
);

    reg [3:0] count;

    always @(posedge clk, posedge rst) begin
    
        if (rst)
            count <= 4'b0000;
        else if (en2) begin
            if (count == 4'b1001)
                count <= 4'b0000;
            else
                count <= count + 1;
        end
    end

    assign co2 = count == 4'b1001;

endmodule
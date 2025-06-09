module pwm (
    input wire clk,
    input wire rst,
    input wire [7:0] in,
    output reg out
);

    reg [7:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 8'd0;
            out <= 1'b0;
        end else begin
            count <= count + 8'd1;
            out <= (count < in) ? 1'b1 : 1'b0;
        end
    end
    
endmodule
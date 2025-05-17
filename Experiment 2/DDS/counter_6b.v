module counter_6b (
    input wire clk,
    input wire rst,
    input wire enable,
    output co,
    output reg [5:0] addr
);

    always @(posedge clk) begin
    
        if (rst)
            addr <= 6'b000000;
        else if (enable) begin
            if (addr == 6'b111111)
                addr <= 6'b000000;
            end
            else
                addr <= addr + 1;
        end
    end

    assign co = &addr;

endmodule
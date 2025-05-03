module demux (
    input ser_in,
    input [1:0] port_num, 
    output reg [3:0] p
);

always @(ser_in or port_num) begin
    p = 4'b0000;      
    case (port_num)
        2'b00: p[0] = ser_in;
        2'b01: p[1] = ser_in;
        2'b10: p[2] = ser_in;
        2'b11: p[3] = ser_in;
    endcase
end

endmodule
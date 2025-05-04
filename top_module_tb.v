`timescale 1ns/1ns

module top_module_tb;
    reg clk;
    reg rst;
    reg ser_in;
    reg clkpb;

    wire [3:0] LEDR;
    wire [1:0] LEDG;
    wire [1:0] HEX;

    top_module uut (
        .clk(clk),
        .rst(rst),
        .ser_in(ser_in),
        .clkpb(clkpb),
        .LEDR(LEDR),
        .LEDG(LEDG),
        .HEX(HEX)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial clkpb = 0;
    always #30 clkpb = ~clkpb;

    initial begin
        rst = 1;
        ser_in = 0;

        #50;
        rst = 0;

        #100;

        send_serial(8'b10110110);

        #1000;

        $stop;
    end

    task send_serial(input [0:7] data);
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1) begin
                ser_in = data[i];
                #20;
            end
        end
    endtask

endmodule
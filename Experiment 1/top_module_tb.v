`timescale 1ns/1ns

module top_module_tb;
    reg clk;
    reg rst;
    reg ser_in;
    reg clkpb;

    wire [3:0] LEDR;
    wire [1:0] LEDG;
    wire [6:0] HEX0;
    wire [6:0] HEX1;

    top_module uut (
        .clk(clk),
        .rst(rst),
        .ser_in(ser_in),
        .clkpb(clkpb),
        .LEDR(LEDR),
        .LEDG(LEDG),
        .HEX0(HEX0),
        .HEX1(HEX1)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial clkpb = 0;
    always #30 clkpb = ~clkpb;

    initial begin
        rst = 1;

        #10;
        rst = 0;

        #55;
        send_serial(34'b1010110011010101010101010101010101);

        #100;
        $stop;
    end

    task send_serial(input [0:33] data);
        integer i;
        begin
            for (i = 0; i < 34; i = i + 1) begin
                ser_in = data[i];
                #60;
            end
        end
    endtask

endmodule
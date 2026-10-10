`timescale 1ns / 1ps

module tb_stepper_motor_controller();

reg clk, rst_n, dir, en;
wire [3:0] coil;

stepper_motor_controller DUT(
    .clk(clk),
    .rst_n(rst_n),
    .dir(dir),
    .en(en),
    .coil(coil)
);

// 10 ns clock period
initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
    // Initial conditions and asynchronous reset
    rst_n = 1'b0;
    en = 1'b0;
    dir = 1'b1;

    #12;
    rst_n = 1'b1;

    // Forward rotation: S0 -> S1 -> S2 -> S3 -> S0
    en = 1'b1;
    dir = 1'b1;
    repeat (4) @(posedge clk);

    // Stop and hold the current position
    en = 1'b0;
    repeat (3) @(posedge clk);

    // Reverse rotation: S0 -> S3 -> S2 -> S1 -> S0
    en = 1'b1;
    dir = 1'b0;
    repeat (4) @(posedge clk);

    #2;
    $finish;
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2026 20:32:56
// Design Name: 
// Module Name: tb_decoder_7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_decoder_7seg();

reg x2, x1, x0;

wire A, B, C, D, E, F, G;

decoder_7seg DUT(
    .x2(x2),
    .x1(x1),
    .x0(x0),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),
    .F(F),
    .G(G)
);

initial begin

    // 000
    x2 = 0; x1 = 0; x0 = 0;
    #10;

    // 001 -> 1
    x2 = 0; x1 = 0; x0 = 1;
    #10;

    // 010 -> F
    x2 = 0; x1 = 1; x0 = 0;
    #10;

    // 011 -> 2
    x2 = 0; x1 = 1; x0 = 1;
    #10;

    // 100 -> A
    x2 = 1; x1 = 0; x0 = 0;
    #10;

    // 101 -> b
    x2 = 1; x1 = 0; x0 = 1;
    #10;

    // 110 -> C
    x2 = 1; x1 = 1; x0 = 0;
    #10;

    // 111 -> 8
    x2 = 1; x1 = 1; x0 = 1;
    #10;

    $finish;

end



endmodule

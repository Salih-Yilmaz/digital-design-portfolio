`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2026 20:29:55
// Design Name: 
// Module Name: decoder_7seg
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


module decoder_7seg(
    input  x2,
    input  x1,
    input  x0,
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G
    );
    
assign A = x1 | ~x0;

assign B = (x0 & x1) |
           (~x0 & ~x1) |
           (~x1 & ~x2);

assign C = ~x1 |
           (x0 & x2);

assign D = (x0 & x1) |
           (x0 & x2) |
           (x1 & x2);

assign E = x1 | x2;

assign F = x2 | ~x0;

assign G = (x0 & x1) |
           (x1 & ~x2) |
           (x2 & ~x1);  
    
   
endmodule

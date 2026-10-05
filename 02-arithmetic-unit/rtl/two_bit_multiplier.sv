`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2026 15:20:22
// Design Name: 
// Module Name: two_bit_multiplier
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


module two_bit_multiplier(

    input A1,
    input A0,
    input B1,
    input B0,
    output M0,
    output M1,
    output M2,
    output M3
);
    
    
wire P0, P1, P2, P3;
wire MC1; 


assign P0 = A0 & B0;   
assign P1 = A1 & B0;  
assign P2 = A0 & B1;  
assign P3 = A1 & B1;  
assign M0 = P0;
    
half_adder HA_M1(

    .A(P1),
    .B(P2),
    .S(M1),
    .C(MC1)

);
    
half_adder HA_M2(

    .A(P3),
    .B(MC1),
    .S(M2),
    .C(M3)

);    
    
    
    
    
    
endmodule












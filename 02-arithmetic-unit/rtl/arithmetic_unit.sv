`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2026 14:51:23
// Design Name: 
// Module Name: arithmetic_unit
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


module arithmetic_unit(

    input A1,
    input A0,
    input B1,
    input B0,
    input opcode,
    output [3:0] RESULT
);
    
wire S1;
wire S0;
wire C2;

wire [3:0] ADD_RESULT;

two_bit_adder ADDER(

    .A1(A1),
    .A0(A0),
    .B1(B1),
    .B0(B0),
    .S1(S1),
    .S0(S0),
    .C2(C2)
);
    
assign ADD_RESULT = {1'b0, C2, S1, S0};



wire M0;
wire M1;
wire M2;
wire M3;

wire [3:0] MUL_RESULT;

two_bit_multiplier MULTI(

    .A1(A1),
    .A0(A0),
    .B1(B1),
    .B0(B0),
    .M0(M0),
    .M1(M1),
    .M2(M2),
    .M3(M3)
);

assign MUL_RESULT = {M3, M2, M1, M0};

assign RESULT = opcode ? MUL_RESULT : ADD_RESULT ; 

endmodule

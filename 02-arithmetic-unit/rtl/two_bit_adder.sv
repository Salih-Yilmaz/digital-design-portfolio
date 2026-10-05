`timescale 1ns / 1ps

module two_bit_adder(

    input A1,
    input A0,
    input B1,
    input B0,
    output S1,
    output S0,
    output C2

);   // Port tanýmý

wire C1;  // C1, two_bit_adder modülü içerisindeki iki alt modül arasýndaki ara baðlantý sinyalidir.

half_adder HA(

    .A(A0),
    .B(B0),
    .S(S0),
    .C(C1)

);

full_adder FA(

    .A(A1),
    .B(B1), 
    .Cin(C1), 
    .S(S1),
    .Cout(C2)
);


endmodule
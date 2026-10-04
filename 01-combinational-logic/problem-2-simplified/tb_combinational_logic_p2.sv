`timescale 1ns/1ps
module tb_combinational_logic_p2;
reg A1, A0, B1, B0;
wire F;
combinational_logic_p2 DUT (.A1(A1), .A0(A0), .B1(B1), .B0(B0), .F(F));
initial begin
    A1=0; A0=0; B1=0; B0=0; #10;
    A1=0; A0=0; B1=0; B0=1; #10;
    A1=0; A0=0; B1=1; B0=0; #10;
    A1=0; A0=0; B1=1; B0=1; #10;
    A1=0; A0=1; B1=0; B0=0; #10;
    A1=0; A0=1; B1=0; B0=1; #10;
    A1=0; A0=1; B1=1; B0=0; #10;
    A1=0; A0=1; B1=1; B0=1; #10;
    A1=1; A0=0; B1=0; B0=0; #10;
    A1=1; A0=0; B1=0; B0=1; #10;
    A1=1; A0=0; B1=1; B0=0; #10;
    A1=1; A0=0; B1=1; B0=1; #10;
    A1=1; A0=1; B1=0; B0=0; #10;
    A1=1; A0=1; B1=0; B0=1; #10;
    A1=1; A0=1; B1=1; B0=0; #10;
    A1=1; A0=1; B1=1; B0=1; #10;
    $finish;
end
endmodule

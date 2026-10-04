module combinational_logic_p2(
    input A0,
    input A1,
    input B1,
    input B0,
    output F
);

assign F = ~B1 & ~B0 |
           A1 & A0   |
           A0 & ~B0  |
           A1 & ~B0  |
           A0 & ~B1  |
           A1 & ~B1;

endmodule

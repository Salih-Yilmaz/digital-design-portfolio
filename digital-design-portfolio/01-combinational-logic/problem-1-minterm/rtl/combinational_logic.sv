module combinational_logic(
    input A1,
    input A0,
    input B1,
    input B0,
    output F
);

wire m0, m4, m5, m6,
     m8, m9, m10,
     m12, m13, m14, m15;

assign m0 = ~A1 & ~A0 & ~B1 & ~B0;
assign m4 = ~A1 &  A0 & ~B1 & ~B0;
assign m5 = ~A1 &  A0 & ~B1 &  B0;
assign m6 = ~A1 &  A0 &  B1 & ~B0;

assign m8  =  A1 & ~A0 & ~B1 & ~B0;
assign m9  =  A1 & ~A0 & ~B1 &  B0;
assign m10 =  A1 & ~A0 &  B1 & ~B0;

assign m12 =  A1 & A0 & ~B1 & ~B0;
assign m13 =  A1 & A0 & ~B1 &  B0;
assign m14 =  A1 & A0 &  B1 & ~B0;
assign m15 =  A1 & A0 &  B1 &  B0;

assign F = m0 | m4 | m5 | m6 |
           m8 | m9 | m10 |
           m12 | m13 | m14 | m15;

endmodule

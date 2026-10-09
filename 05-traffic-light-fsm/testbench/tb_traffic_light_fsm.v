`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2026 11:57:50
// Design Name: 
// Module Name: tb_traffic_light_fsm
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


module tb_traffic_light_fsm();

reg clk;  
reg SB;
reg reset;
wire Ak, As, Ay;
wire Bk, Bs, By;



traffic_light_fsm DUT(

    .clk(clk),
    .SB(SB),
    .reset(reset),
    .Ak(Ak), .As(As), .Ay(Ay),
    .Bk(Bk), .Bs(Bs), .By(By)
);


initial begin
    clk = 0;
end

always #5 clk = ~clk;

initial begin
    // Baþlangýç deðerleri
    clk = 0;
    SB = 0;
    reset = 1;
    #10;
    // Reset'i birkaç clock boyunca aktif tut
    
    reset = 0;

    // S0: A yeþil, B kýrmýzý
    // Araç yok; sistem S0'da kalmalý
    SB = 0;
    #50;

    // S0'da süre sonunda araç var
    // S1'e geçiþi gözlemle
    SB = 1;
    #200;

    // S1 -> S2 -> S3 geçiþlerini gözlemle
   

    // B yolu yeþilken araç sensörünü tekrar deðiþtir
    // S3'ün süresi SB'den baðýmsýz olmalý
    SB = 0;
    #150;

    // Simülasyonu bitir
    $finish;
end



endmodule















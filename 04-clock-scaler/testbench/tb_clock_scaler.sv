`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 22:24:44
// Design Name: 
// Module Name: tb_clock_scaler
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


module tb_clock_scaler();

reg [3:0]sel;
reg clk_in;
wire clk_out;

clock_scaler DUT(
    
    .sel(sel),
    .clk_in(clk_in),
    .clk_out(clk_out)
);

initial begin 
    clk_in = 0;
end

always #5 clk_in = ~clk_in;


initial begin

    sel = 1;
    #400;
    
    sel = 2;
    #400;
    
    sel = 3;
    #400;
    
    sel = 4;
    #400;
    $finish;

end
endmodule















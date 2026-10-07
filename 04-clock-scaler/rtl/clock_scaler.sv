`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 18:36:09
// Design Name: 
// Module Name: clock_scaler
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


module clock_scaler(

    input wire clk_in,  // input olarak gelen clock giriþ sinyali
    input wire [3:0]sel, 
    output reg clk_out  // always bloðunda deðer alýp güncellenecek olan çýkýþ sinyali 
);

reg [15:0] counter = 16'b0;

always @(posedge clk_in)
    begin 
        counter <= counter + 1;
    end    

always @(*) 
    begin
        case(sel)
            4'd1: begin clk_out = counter[0]; end
            4'd2: begin clk_out = counter[1]; end           
            4'd3: begin clk_out = counter[2];end
            4'd4: begin clk_out = counter[3];end
            default: begin clk_out = 1'b0; end
        endcase
    end


endmodule











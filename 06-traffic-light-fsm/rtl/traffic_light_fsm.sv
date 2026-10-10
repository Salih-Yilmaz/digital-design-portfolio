`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2026 16:42:33
// Design Name: 
// Module Name: traffic_light_fsm
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


module traffic_light_fsm(

    input wire clk,  // testbench tarafýndan üretilip input oalrak verilecek
    input wire SB,
    input wire reset,
    output reg Ak, As, Ay,
    output reg Bk, Bs, By

);

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;

reg [2:0] current_state;
reg [2:0] next_state;
reg [3:0] counter;

    always @(*) begin
    
        case(current_state) 
        
            S0: begin 
                    if( (SB == 1) && (counter == 10) )
                        next_state = S1; 
                            
                    else 
                        next_state = S0; 
                    
                end
                     
            S1: begin next_state = S2; end
    
            S2: begin next_state = S3; end
    
            S3: begin 
                if(counter == 10)
                    next_state = S4; 
                    
                 else 
                    next_state = S3;
                 
                end
    
            S4: begin next_state = S5; end
    
            S5: begin next_state = S0; end
            
            default: begin next_state = S0; end
        endcase
    end
    
    
    always @(posedge clk) begin
    
        if (reset) begin
            current_state <= S0;
            counter <= 0;
        end
        
        else begin
            current_state <= next_state;
            
                if(current_state != next_state) 
                    counter <= 0; 
                
                else if(counter == 10) 
                    begin
                        if(SB == 0)
                            counter <= 0;         
                    end
                    
                else  
                    counter <= counter + 1;
              end             
    end
        
    always @(*) begin

    case (current_state)

        // S0: A yeþil, B kýrmýzý
        S0: begin
            Ay = 1'b1;
            As = 1'b0;
            Ak = 1'b0;

            By = 1'b0;
            Bs = 1'b0;
            Bk = 1'b1;
        end

        // S1: A sarý, B kýrmýzý
        S1: begin
            Ay = 1'b0;
            As = 1'b1;
            Ak = 1'b0;

            By = 1'b0;
            Bs = 1'b0;
            Bk = 1'b1;
        end

        // S2: A kýrmýzý, B sarý
        S2: begin
            Ay = 1'b0;
            As = 1'b0;
            Ak = 1'b1;

            By = 1'b0;
            Bs = 1'b1;
            Bk = 1'b0;
        end

        // S3: A kýrmýzý, B yeþil
        S3: begin
            Ay = 1'b0;
            As = 1'b0;
            Ak = 1'b1;

            By = 1'b1;
            Bs = 1'b0;
            Bk = 1'b0;
        end

        // S4: A kýrmýzý, B sarý
        S4: begin
            Ay = 1'b0;
            As = 1'b0;
            Ak = 1'b1;

            By = 1'b0;
            Bs = 1'b1;
            Bk = 1'b0;
        end

        // S5: A sarý, B kýrmýzý
        S5: begin
            Ay = 1'b0;
            As = 1'b1;
            Ak = 1'b0;

            By = 1'b0;
            Bs = 1'b0;
            Bk = 1'b1;
        end

        // Geçersiz state: tüm ýþýklarý kapat
        default: begin
            Ay = 1'b0;
            As = 1'b0;
            Ak = 1'b0;

            By = 1'b0;
            Bs = 1'b0;
            Bk = 1'b0;
        end

    endcase
end
  
  
endmodule











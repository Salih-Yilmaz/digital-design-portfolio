`timescale 1ns / 1ps

module stepper_motor_controller(
    input wire rst_n,
    input wire en,
    input wire dir,
    input wire clk,
    output reg [3:0] coil
);

reg [1:0] current_state;
reg [1:0] next_state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// State register with asynchronous active-low reset
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        current_state <= S0;
    else
        current_state <= next_state;
end

// Next-state logic
always @(*) begin
    next_state = current_state;

    if (en == 1'b0) begin
        next_state = current_state;
    end
    else if (dir == 1'b1) begin
        case (current_state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end
    else begin
        case (current_state)
            S0: next_state = S3;
            S1: next_state = S0;
            S2: next_state = S1;
            S3: next_state = S2;
            default: next_state = S0;
        endcase
    end
end

// Moore output logic
always @(*) begin
    case (current_state)
        S0: coil = 4'b1000;
        S1: coil = 4'b0100;
        S2: coil = 4'b0010;
        S3: coil = 4'b0001;
        default: coil = 4'b0000;
    endcase
end

endmodule

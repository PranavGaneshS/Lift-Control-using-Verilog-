`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: Lift
// Description:
// 4-Floor Elevator Controller using FSM
//
// Floors:
// 00 -> Floor 0
// 01 -> Floor 1
// 10 -> Floor 2
// 11 -> Floor 3
//
// States:
// REST  - Waiting for request
// UP    - Moving upward
// DOWN  - Moving downward
// DOOR  - Door open
//////////////////////////////////////////////////////////////////////////////////

module Lift(
    input wire clk,
    input wire reset,
    input wire [1:0] request,

    output reg moving_up,
    output reg moving_down,
    output reg door,
    output reg [1:0] current
);

    // FSM States
    parameter REST  = 2'b00, UP    = 2'b01, DOWN  = 2'b10, DOOR  = 2'b11;
  
    reg [1:0] state;
    reg [1:0] target_floor;
    reg [2:0] timer;

    always @(posedge clk or posedge reset)
    begin

        if(reset)
        begin
            current      <= 2'b00;
            target_floor <= 2'b00;
            moving_up    <= 0;
            moving_down  <= 0;
            door         <= 0;
            timer        <= 0;
            state        <= REST;
        end

        else
        begin

            case(state)

            // REST STATE
            
            REST:
            begin
                moving_up   <= 0;
                moving_down <= 0;
                door        <= 0;
                timer       <= 0;

                // Capture new request
                if(request != current)
                begin
                    target_floor <= request;

                    if(request > current)
                        state <= UP;
                    else
                        state <= DOWN;
                end
            end

            // MOVE UP
            
            UP:
            begin
                moving_up   <= 1;
                moving_down <= 0;

                if(current < target_floor)
                    current <= current + 1;
                else
                begin
                    moving_up <= 0;
                    state <= DOOR;
                end
            end

            DOWN:
            begin
                moving_up   <= 0;
                moving_down <= 1;

                if(current > target_floor)
                    current <= current - 1;
                else
                begin
                    moving_down <= 0;
                    state <= DOOR;
                end
            end

            // DOOR OPEN
            
            DOOR:
            begin
                door <= 1;

                if(timer < 3)
                    timer <= timer + 1;
                else
                begin
                    door <= 0;
                    timer <= 0;
                    state <= REST;
                end
            end

            endcase

        end

    end

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 01:34:31 PM
// Design Name: 
// Module Name: Sequential_Multiplier
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


module Sequential_Multiplier(
input [3:0]operand_a, input [3:0]operand_b, 
input reset, input clk,
output reg [7:0]product
);
    parameter s0_idle = 0, s1_multiplier = 1, s2_update = 2, s3_done = 3;
    
    reg [1:0] NS, PS;
    reg [7:0] partial_product;
    reg [2:0] shift_count;
    reg [7:0] multiplicand;
    reg [3:0] operand_bb;
    
    always@(posedge clk or posedge reset)
    begin
        if (reset == 1)
            PS <= s0_idle;
            
        else
            PS <= NS;
    end
    
    //state functions
    always @(posedge clk)
        begin
            case(PS)
                s0_idle: begin
                    partial_product <= 8'b0;
                    multiplicand <= {4'b0, operand_a};
                    operand_bb <= operand_b;
                    shift_count <= 3'b0;
                    NS = s1_multiplier;
                end
                
                s1_multiplier: begin
                    if(operand_bb[0] == 0 && shift_count < 4) begin
                        partial_product <= partial_product;
                        multiplicand <= multiplicand <<1;
                        operand_bb <= operand_bb >>1;
                        shift_count <= shift_count + 3'b1;
                        end
                    else if ((operand_bb[0] == 1) && (shift_count < 4)) begin
                        partial_product <= partial_product + multiplicand;
                        multiplicand <= multiplicand <<1;
                        operand_bb <= operand_bb >>1;
                        shift_count <= shift_count + 3'b1;
                        end
                    if (shift_count == 4)
                    begin
                        NS = s2_update;
                    end
                    else
                    begin
                        NS = s1_multiplier;
                    end
                 end
                 
                 s2_update: begin
                        NS = s3_done;
                        product <= partial_product;
                 end
                 
                 s3_done: begin
                    NS = s0_idle;
                    end
                 endcase
            end
                    
                
endmodule

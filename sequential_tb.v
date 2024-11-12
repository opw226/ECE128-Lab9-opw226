`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 02:11:44 PM
// Design Name: 
// Module Name: sequential_tb
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


module sequential_tb();
    reg [3:0]operand_a;
    reg [3:0]operand_b;
    reg reset;
    reg clk;
    wire [7:0]product;
    
    Sequential_Multiplier uut(.operand_a(operand_a), .operand_b(operand_b), .reset(reset), .clk(clk), .product(product));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1; #10;
        reset = 0;
        operand_a = 4'b1001; operand_b = 4'b1101; #500;
        reset = 1; #10;
        reset = 0;
        operand_a = 4'b1101; operand_b = 4'b0001; #500;
        reset = 1; #10;
        reset = 0;
        operand_a = 4'b1111; operand_b = 4'b1001; #500;
        reset = 1; #10;
        reset = 0;
        operand_a = 4'b1000; operand_b = 4'b0000; #500;
        reset = 1; #10;
        reset = 0;
        operand_a = 4'b1010; operand_b = 4'b0101; #500;
        reset = 1; #10;
        reset = 0;
        operand_a = 4'b0010; operand_b = 4'b1101; #500;
        reset = 1; #10;
        reset = 0;

    end
    
    
        

endmodule

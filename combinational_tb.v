`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 03:01:24 PM
// Design Name: 
// Module Name: combinational_tb
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


module combinational_tb();

reg [3:0] a, b;
wire [7:0] p;

Combinational_Multiplier uut (.a(a), .b(b), .p(p));

initial begin
    a = 1001; b = 1000; #50;
    a = 1101; b = 1010; #50;
    a = 0101; b = 1001; #50;
    a = 0011; b = 1100; #50;
    a = 1001; b = 1010; #50;
    a = 1011; b = 0010; #50;
    
    
 end
 

endmodule

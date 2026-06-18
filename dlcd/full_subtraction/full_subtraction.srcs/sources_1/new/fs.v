`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 21:15:05
// Design Name: 
// Module Name: fs
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


module fs( input a,b,bin,output reg d,bout);
always @(*)
        begin
        d= a^b^bin;
        bout= (~a&b)|(~a&bin)|(bin&b);
        end
endmodule

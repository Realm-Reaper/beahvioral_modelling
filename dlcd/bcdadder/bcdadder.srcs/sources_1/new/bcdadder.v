`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 22:57:56
// Design Name: 
// Module Name: bcdadder
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

module bcdadder(input [3:0] a,[3:0] b,input c,output [3:0] s,output cout);
reg [4:0] temp;
always @(*) begin
       temp=a+b+c;
       if (temp>5'd9)
           temp=4'b0110 +temp;
       else
           temp=temp;
       end
assign s= temp[3:0];
assign cout = temp[4];
endmodule

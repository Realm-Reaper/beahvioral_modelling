`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 22:29:41
// Design Name: 
// Module Name: rca
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


module rca(input [3:0]a,[3:0]b,input c,output [3:0]s,output cout);
wire w1,w2,w3;
fa fa0(a[0],b[0],c,s[0],w1);
fa fa1(a[1],b[1],w1,s[1],w2);
fa fa2(a[2],b[2],w2,s[2],w3);
fa fa3(a[3],b[3],w3,s[3],cout);

endmodule

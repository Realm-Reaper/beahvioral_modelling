`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 21:06:37
// Design Name: 
// Module Name: hs_tb
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


module hs_tb();
reg a,b;
wire d,bout;
hs dut(a,b,d,bout);
initial
     begin
     $monitor("Time = %0t | a = %b, b = %b | difference = %b,  borrow= %b", $time, a, b, d, bout);
        
        // Test sequence covering all 4 possible combinations
        a = 1'b0; b = 1'b0; 
        #1;
        
        a = 1'b0; b = 1'b1; 
        #1;
        
        a = 1'b1; b = 1'b0; 
        #1;
        
        a = 1'b1; b = 1'b1; 
        #1;
        
        // End the simulation
        $finish;
    end
endmodule

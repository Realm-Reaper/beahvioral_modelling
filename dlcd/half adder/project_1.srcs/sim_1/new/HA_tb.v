`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 15:54:32
// Design Name: 
// Module Name: HA_tb
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
module HA_tb();
reg a,b;
wire sum, carry;
halfadder dut(a,b,sum,carry);
initial begin
        // Monitor changes in inputs and outputs
        $monitor("Time = %0t | a = %b, b = %b | sum = %b, carry = %b", $time, a, b, sum, carry);
        
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


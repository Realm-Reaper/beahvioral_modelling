`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 20:22:35
// Design Name: 
// Module Name: FA_tb
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


module FA_tb();
reg a,b,cin;
wire sum,carry;
FA dut(a,b,cin,sum,carry);
initial 
   begin
        $monitor("Time = %0t | a = %b, b = %b, cin = %b | sum = %b, cout = %b", $time, a, b, cin, sum, carry);
        
        // Test sequence covering all 8 possible combinations
        a = 1'b0; b = 1'b0; cin = 1'b0; #1;
        a = 1'b0; b = 1'b0; cin = 1'b1; #1;
        
        a = 1'b0; b = 1'b1; cin = 1'b0; #1;
        a = 1'b0; b = 1'b1; cin = 1'b1; #1;
        
        a = 1'b1; b = 1'b0; cin = 1'b0; #1;
        a = 1'b1; b = 1'b0; cin = 1'b1; #1;
        
        a = 1'b1; b = 1'b1; cin = 1'b0; #1;
        a = 1'b1; b = 1'b1; cin = 1'b1; #1;
        
        // End the simulation
        $finish;
    end
   
endmodule

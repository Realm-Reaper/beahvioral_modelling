`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 22:33:46
// Design Name: 
// Module Name: rca_tb
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

module rca_tb();
    reg [3:0] A,B;
    reg Cin;
    wire [3:0] s;
    wire cout;
    
    rca dut(A,B,Cin,s,cout);
    
    initial begin
        // ERROR 1 FIXED: Changed 'a, b, cin' to 'A, B, Cin'
        $monitor("Time = %0t | A = %2d, B = %2d, Cin = %b | Sum = %2d, Cout = %b", $time, A, B, Cin, s, cout);
        
        // Test Case 1: 0 + 0 + 0 = 0
        A = 4'd0; B = 4'd0; Cin = 1'b0; #10;
        
        // Test Case 2: 5 + 3 + 0 = 8
        A = 4'd5; B = 4'd3; Cin = 1'b0; #10;
        
        // Test Case 3: 10 + 5 + 0 = 15 (Max 4-bit value)
        A = 4'd10; B = 4'd5; Cin = 1'b0; #10;
        
        // Test Case 4: 15 + 1 + 0 = 16 -> Overflow (Sum = 0, Cout = 1)
        A = 4'd15; B = 4'd1; Cin = 1'b0; #10;
        
        // Test Case 5: 7 + 7 + 1 = 15 (Testing Carry-In)
        A = 4'd7; B = 4'd7; Cin = 1'b1; #10;
        
        // Test Case 6: 15 + 15 + 1 = 31 -> Absolute Max (Sum = 15, Cout = 1)
        A = 4'd15; B = 4'd15; Cin = 1'b1; #10;
        
        // End the simulation
        $finish;
    end
endmodule

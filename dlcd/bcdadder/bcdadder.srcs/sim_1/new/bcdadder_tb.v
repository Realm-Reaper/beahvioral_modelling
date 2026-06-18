`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 22:58:41
// Design Name: 
// Module Name: bcdadder_tb
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
   module bcdadder_tb();
    reg [3:0] a, b;
    reg c;
    wire [3:0] s;
    wire cout;

    // Declare integers for our nested loops
    integer i, j, k;
    bcdadder dut(a,b,c,s,cout);
    initial begin
        // Monitor changes in decimal format for easy reading
        $monitor("Time = %0t | Cin = %b | A = %d, B = %d | Sum = %d, Cout = %b", $time, c, a, b, s, cout);
        
        // Loop 1: Carry-In (0 to 1)
        for (k = 0; k < 2; k = k + 1) begin
            
            // Loop 2: Input A (Valid BCD: 0 to 9)
            for (i = 0; i < 10; i = i + 1) begin
                
                // Loop 3: Input B (Valid BCD: 0 to 9)
                for (j = 0; j < 10; j = j + 1) begin
                    
                    // Assign loop counter variables to our inputs
                    c = k;
                    a = i;
                    b = j;
                    
                    // Wait 10 time units for logic to process
                    #10; 
                end
            end
        end
        
        // End simulation after all loops finish (2 * 10 * 10 = 200 combinations)
        $finish;
    end
endmodule
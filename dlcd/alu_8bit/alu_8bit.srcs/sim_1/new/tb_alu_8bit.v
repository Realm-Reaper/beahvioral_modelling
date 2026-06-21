`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 13:29:18
// Design Name: 
// Module Name: tb_alu_8bit
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


`timescale 1ns / 1ps

module tb_alu_8bit;

    // Testbench signals
    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] opcode;

    wire [15:0] y;
    wire carryout;
    wire borrowout;
    wire zero;

    // Loop integer
    integer i;

    // Instantiate the Device Under Test (DUT)
    alu_8bit dut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .y(y),
        .carryout(carryout),
        .borrowout(borrowout),
        .zero(zero)
    );

    initial begin
        // Display header for the console output
        $display("---------------------------------------------------------------------------------------------");
        $display("Time | Opcode |   a   |   b   |        y (Hex)        |        y (Dec)        | C | B | Z |");
        $display("---------------------------------------------------------------------------------------------");
        
        // Monitor changes and print them automatically
        $monitor("%4d |  %b  |  %3d  |  %3d  | 16'h%h | %6d | %b | %b | %b |", 
                 $time, opcode, a, b, y, y, carryout, borrowout, zero);

        // ---------------------------------------------------------
        // Set Constant Inputs
        // ---------------------------------------------------------
        // a = 170 (10101010 in binary)
        // b = 85  (01010101 in binary)
        a = 8'd170; 
        b = 8'd85;  

        // ---------------------------------------------------------
        // Loop through all 16 Opcodes (0000 to 1111)
        // ---------------------------------------------------------
        for (i = 0; i < 16; i = i + 1) begin
            opcode = i[3:0]; // Assign the lower 4 bits of 'i' to opcode
            #10;             // Wait 10 time units for logic to process
        end

        // ---------------------------------------------------------
        // End Simulation
        // ---------------------------------------------------------
        $display("---------------------------------------------------------------------------------------------");
        $display("All test cases finished successfully!");
        $finish;
    end

endmodule
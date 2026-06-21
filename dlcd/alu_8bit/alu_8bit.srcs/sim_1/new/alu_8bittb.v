`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 12:56:34
// Design Name: 
// Module Name: alu_8bittb
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


module alu_8bittb( );
reg [7:0] a,b;
reg [3:0] opcode;
// Outputs
    wire [15:0] y;
    wire carryout;
    wire borrowout;
    wire zero;

    // Loop variables for stress testing
    integer i;
    integer error_count;

    // Instantiate the Unit Under Test (UUT)
    alu_8bit dut (a,b,opcode,y,carryout,borrowout,zero);

    initial begin
      
        a = 0;
        b = 0;
        opcode = 0;
        error_count = 0;

        $display("==================================================");
        $display("   STARTING ALU STRESS TEST & EXTREME CONDITIONS  ");
        $display("==================================================");

        // PHASE 1: EXTREME CORNER CASES

        $display("\n--- Phase 1: Directed Extreme Conditions ---");

        // 1. Division by Zero
        opcode = 4'b0100; a = 8'hFF; b = 8'h00; #10;
        $display("DIV_BY_ZERO  | a=%3d, b=%3d | y=%d | Z=%b", a, b, y, zero);
        if (y !== 16'b0) error_count = error_count + 1;

        // 2. Maximum Addition Overflow (255 + 255 = 510)
        opcode = 4'b0000; a = 8'hFF; b = 8'hFF; #10;
        $display("MAX_ADD_OVF  | a=%3d, b=%3d | y=%d | C=%b", a, b, y, carryout);

        // 3. Minimum Subtraction Underflow (0 - 255)
        opcode = 4'b0001; a = 8'h00; b = 8'hFF; #10;
        $display("MIN_SUB_UND  | a=%3d, b=%3d | y=%d | C=%b", a, b, y, carryout);

        // 4. Maximum Multiplication (255 * 255 = 65025)
        opcode = 4'b0010; a = 8'hFF; b = 8'hFF; #10;
        $display("MAX_MULT     | a=%3d, b=%3d | y=%d", a, b, y);

        // 5. Alternating Bits XOR (10101010 ^ 01010101)
        opcode = 4'b1001; a = 8'hAA; b = 8'h55; #10;
        $display("ALT_BITS_XOR | a=%b, b=%b | y=%b", a, b, y);

        // 6. Two's Complement on Zero (Check carryout/zero flag behavior)
        opcode = 4'b1011; a = 8'h00; b = 8'h00; #10;
        $display("2S_COMP_ZERO | a=%3d, b=%3d | y[7:0]=%d, y[15:8]=%d | C=%b", a, b, y[7:0], y[15:8], carryout);

        // 7. Maximum Shift Boundary (Shift out MSB to carry)
        opcode = 4'b1100; a = 8'h80; b = 8'h00; #10;
        $display("MAX_SHIFT_L  | a=%b       | y=%b | C=%b", a, y, carryout);


        // -----------------------------------------------------------
        // PHASE 2: RANDOMIZED HIGH-VOLUME STRESS TEST
        // -----------------------------------------------------------
        $display("\n--- Phase 2: High-Volume Randomized Stress Test ---");
        $display("Injecting 50,000 random stimulus vectors...");
        
        for (i = 0; i < 50000; i = i + 1) begin
            // Generate random 8-bit inputs
            a = $random % 256;
            b = $random % 256;
            // Generate random 4-bit opcode (0 to 15)
            opcode = $random % 16;           
            #1; // Extremely aggressive 1ns delay to stress simulation events           
            // Basic sanity assertions during stress test
            // 1. Ensure zero flag is perfectly synchronized with y
            if ((y == 16'd0 && zero == 1'b0) || (y != 16'd0 && zero == 1'b1)) begin
                $display("FAIL @ Time %0t: Zero flag mismatch! op=%b, y=%d, z=%b", $time, opcode, y, zero);
                error_count = error_count + 1;
            end
            // 2. Ensure NO unhandled Xs (unknown states) propagate to output
            if (y === 16'hx || carryout === 1'bx || zero === 1'bx) begin
                $display("FAIL @ Time %0t: Unknown state (X) detected! op=%b", $time, opcode);
                error_count = error_count + 1;
            end
        end
       
        // END OF TEST
        $display("\n==================================================");
        if (error_count == 0)
            $display("   STRESS TEST PASSED SUCCESSFULLY. 0 ERRORS.     ");
        else
            $display("   STRESS TEST FAILED WITH %0d ERRORS.            ", error_count);
        $display("==================================================");
        
        $finish;
    end
endmodule

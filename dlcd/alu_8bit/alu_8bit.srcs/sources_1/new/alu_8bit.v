`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 11:13:41
// Design Name: 
// Module Name: alu_8bit
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
module alu_8bit(input  wire [7:0] a, b, input  wire [3:0] opcode,output reg  [15:0] y,output reg  carryout,borrowout,output reg  zero);

    reg [8:0] temp;         
    always @(*) begin
        // Default initializations to prevent latches
        y = 16'b0;
        zero = 1'b0;
        carryout = 1'b0;
        temp = 9'b0;
        
        case(opcode)
            // Arithmetic operations
            4'b0000 : begin // Addition
                temp = a + b;
                y[7:0] = temp[7:0];
                carryout = temp[8];
            end
            4'b0001 : begin // Subtraction
                temp = a - b;
                y[7:0] = temp[7:0];
                borrowout = temp[8];
            end
            4'b0010 : begin // Multiplication
                y = a * b;
            end
            4'b0011 : begin // Comparison
                if (a > b) 
                    y = 16'd1;
                else if (a == b) 
                    y = 16'b1;        // FIXED: Matched 16-bit width
                else 
                    y = 16'd0;        // FIXED: Matched 16-bit width
            end
            4'b0100 : begin // Division & Modulo
                if (b != 8'b0) begin
                    y[7:0]  = a / b;
                    y[15:8] = a % b;
                end else begin
                    y = 16'b0;
                end
            end
            
            // Logical operations
            4'b0101 : y = a | b;          
            4'b0110 : y = a & b;      
            4'b0111 : y = ~(a | b); // NOR
            4'b1000 : y = ~(a & b); // NAND
            4'b1001 : y = a ^ b;    // XOR
            4'b1010 : y = ~(a ^ b); // XNOR
           4'b1011: begin // Two's Complement of both 'a' and 'b'
                // Lower 8 bits hold the two's complement of 'a'
                y[7:0]  = ~a + 1'b1; 
                // Upper 8 bits hold the two's complement of 'b'
                y[15:8] = ~b + 1'b1;  
                // Carryout logic for negation (optional, usually 1 if input is non-zero)
                carryout = (a != 8'd0) ? 1'b1 : 1'b0; 
            end
            
            // Shift & Rotate operations
            4'b1100: begin // Logical Shift Left
                y[7:0]   = a << 1;   
                y[15:8]  = 8'd0;     
                carryout = a[7];     
            end
            4'b1101: begin // Logical Shift Right (FIXED: 4'b01101 to 4'b1101)
                y[7:0]  = a >> 1;    
                y[15:8] = 8'd0;     
            end
            4'b1110: begin // Rotate Left
                y[7:0]  = {a[6:0], a[7]}; 
                y[15:8] = 8'd0;     
            end
            4'b1111: begin // Rotate Right
                y[7:0]  = {a[0], a[7:1]}; 
                y[15:8] = 8'd0;     
            end                     
        endcase
        
       
        if (y == 16'd0)
            zero = 1'b1;
        else
            zero = 1'b0;

    end
endmodule



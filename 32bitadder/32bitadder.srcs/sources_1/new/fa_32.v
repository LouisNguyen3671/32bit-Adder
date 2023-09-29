`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 11:47:36 AM
// Design Name: 
// Module Name: fa_32
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

module fa_1(a, b, c_in, s, c_out);
    input wire a, b, c_in;
    output reg s, c_out;
    
    always@(*) begin
    
        //sum time
        s = a ^ b ^ c_in;
        
        // Carry out.
        c_out = (a & b) | ((a ^ b) & c_in);
        
    end
endmodule

//4-bit Full adder

module fa_4(a, b, c_in, s, c_out);
    input wire [3:0]a;
    input wire [3:0]b;
    input wire c_in;
    
    output wire [3:0]s;
    output wire c_out;
    
    wire [2:0]c_temp;
    
    fa_1 fa_1_0(a[0], b[0], c_in,      s[0], c_temp[0]);
    fa_1 fa_1_1(a[1], b[1], c_temp[0], s[1], c_temp[1]);
    fa_1 fa_1_2(a[2], b[2], c_temp[1], s[2], c_temp[2]);
    fa_1 fa_1_3(a[3], b[3], c_temp[2], s[3], c_out    );    
endmodule



module fa_8(a, b, c_in, s, c_out);
    input wire[7:0]a;
    input wire[7:0]b;
    input wire c_in;
    
    output wire [7:0]s;
    output wire c_out;
    
    wire c_temp;
    
    fa_4 fa_4_0(a[3:0], b[3:0], c_in , s[3:0], c_temp);
    fa_4 fa_4_1(a[7:4], b[7:4], c_temp, s[7:4], c_out);
endmodule



module fa_16(a, b, c_in, s, c_out);
    input wire[15:0]a;
    input wire[15:0]b;
    input wire c_in;
    
    output wire [15:0]s;
    output wire c_out;
    
    wire c_temp;
    
    fa_8 fa_8_0(a[7:0], b[7:0], c_in    , s[7:0], c_temp);
    fa_8 fa_8_1(a[15:8], b[15:8], c_temp, s[15:8], c_out);
endmodule
    
module fa_32(a, b, c_in, s, c_out);
    input wire[31:0]a;
    input wire[31:0]b;
    input wire c_in;
    
    output wire [31:0]s;
    output wire c_out;
    
    wire c_temp;
    
    fa_16 fa_16_0(a[15:0], b[15:0], c_in      ,s[15:0], c_temp);
    fa_16 fa_16_1(a[31:16], b[31:16], c_temp ,s[31:16],  c_out);
endmodule

`timescale 1ns / 1ps
//test bench example 
module tb_fa_32();
    integer a;
    integer b;
    reg c_in;
    
    wire [31:0]s;
    wire c_out;
    
    fa_32 fa_32_0(a, b, c_in, s, c_out);
    
    initial begin
        $monitor("a=%d, b=%d, c_in=%1b, s=%d, c_out=%1b", a, b, c_in, s, c_out);
        c_in = 1'b0;
        
        a = 256;
        b = 256;
        #200;
        
        a = 4;
        b = 35;
        #200;
        
        a = ~(0);
        b = 2;
        #200;
     end
endmodule
        


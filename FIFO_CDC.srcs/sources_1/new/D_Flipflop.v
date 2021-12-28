`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/28 16:39:03
// Design Name: D flip flop (parameterized) 
// Module Name: D_Flipflop
// Project Name: 
// Target Devices: 
// Tool Versions: Vivado 2021.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module D_Flipflop #(parameter addrsize = 8)(
    q,
    clk,
    rst_n,
    d
    );
    
    output [addrsize:0]q;
    input clk;
    input rst_n;
    input [addrsize:0]d;
    
    always@(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
            q <= 0;
        
        else
            q <= d;
    end
endmodule

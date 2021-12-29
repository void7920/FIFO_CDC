`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/29 00:14:14
// Design Name: Empty Check
// Module Name: Flag_Empty
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


module Flag_Empty #(parameter addrsize = 8)(
    empty,
    clk,
    rst_n,
    ptr,
    q2_ptr
    );
    
    output reg empty;
    input clk;
    input rst_n;
    input [addrsize:0]ptr;
    input [addrsize:0]q2_ptr;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            empty <= 1'b1;
        end
        
        else
        begin
            empty <= (ptr == q2_ptr);
        end
    end
endmodule

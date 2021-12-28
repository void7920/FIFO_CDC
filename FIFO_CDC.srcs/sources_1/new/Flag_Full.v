`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/29 00:14:14
// Design Name: Full Check
// Module Name: Flag_Full
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


module Flag_Full #(parameter addrsize = 8)(
    full,
    clk,
    rst_n,
    ptr,
    q2_ptr
    );
    
    output full;
    input clk;
    input rst_n;
    input [addrsize:0]ptr;
    input [addrsize:0]q2_ptr;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            full <= 1'b0;
        end
        
        else
        begin
            full <= (ptr == {~q2_ptr[depth:depth-1], q2_ptr[depth-2:0]});
        end
    end
endmodule

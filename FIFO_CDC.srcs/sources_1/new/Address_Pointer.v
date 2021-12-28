`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/29 00:13:48
// Design Name: Address Pointer
// Module Name: Address_Pointer
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


module Address_Pointer #(parameter addrsize = 8)(
    addr,
    ptr,
    clk,
    rst_n,
    state,
    c
    );
    
    output [addrsize-1:0]addr;
    output reg [addrsize:0]ptr;
    input clk;
    input rst_n;
    input state;
    input c;
    
    reg ptr_bin;
    wire ptr_bin_next = ptr_bin + (~state & c);
    wire ptr_gray_next = (ptr_bin_next >> 1) ^ ptr_bin_next;
    
    always@(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
        begin
            ptr_bin <= 0;
            ptr <= 0;
        end
        
        else
        begin
            ptr_bin <= ptr_bin_next;
            ptr <= ptr_gray_next;
        end
    end
endmodule

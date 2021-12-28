`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/28 16:39:03
// Design Name: Synchronizer
// Module Name: Synchronizer
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


module Synchronizer #(parameter addrsize = 8) (
    q2_ptr,
    clk,
    rst_n,
    ptr    
    );
    
    output [addrsize:0]q2_ptr;
    input clk;
    input rst_n;
    input [addrsize:0]ptr;
    
    wire [addrsize:0]q1_ptr;
    
    D_Flipflop Sync0(.q(q1_ptr), .clk(clk), .rst_n(rst_n), .d(ptr));
    D_Flipflop Sync1(.q(q2_ptr), .clk(clk), .rst_n(rst_n), .d(q1_ptr));
endmodule


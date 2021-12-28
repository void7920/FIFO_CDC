`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/28 16:39:03
// Design Name: Dual Port Ram
// Module Name: Dual_Port_Ram
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


module Dual_Port_Ram #(parameter MSB = 8, parameter addrsize = 8)(
    rd,
    clk,
    wa,
    rd,
    ra,
    we
    );
    
    localparam depth = 1<<addrsize;
    
    output [MSB-1:0]rd;
    input clk;
    input [addrsize-1:0]wa;
    input [MSB-1:0]rd;
    input [addrsize-1:0]ra;
    input we;
    
    reg [MSB-1:0] ram [0:depth];
    
    assign rd = ram[ra];
    
    always@(posedge clk)
    begin
        if(we)
            ram[wa] <= wd;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/28 16:39:03
// Design Name: First Input First Output Register
// Module Name: FIFO
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


module FIFO #(parameter MSB = 8, parameter addrsize = 8)(
    rdata,
    full,
    empty,
    wclken,
    raddr,
    waddr,
    rptr,
    wptr,
    wq2_rptr,
    rq2_wptr,
    wdata,
    wclk, 
    wrst_n, 
    winc,
    rclk, 
    rrst_n, 
    rinc
    );
    
    output [MSB-1:0]rdata;
    output full;
    output empty;
    output wclken;
    output [addrsize-1:0]raddr;
    output [addrsize-1:0]waddr;
    output [addrsize:0]rptr;
    output [addrsize:0]wptr;    
    output [addrsize:0]wq2_rptr;
    output [addrsize:0]rq2_wptr;
    input [MSB-1:0]wdata;
    input wclk;
    input wrst_n;
    input winc;
    input rclk;
    input rrst_n;
    input rinc;
    
    assign wclken = ~full & winc;
    
    // Dual Port Ram
    Dual_Port_Ram #(MSB, addrsize) ram(.rd(rdata), .clk(wclk), .wd(wdata), .ra(raddr), .wa(waddr), .we(wclken));
    
    // wptr & full logic
    Address_Pointer #(addrsize) Write_Pointer(.addr(waddr), .ptr(wptr), .clk(wclk), .rst_n(wrst_n), .state(full), .c(winc));
    Flag_Full #(addrsize) Full_Flag(.full(full), .clk(wclk), .rst_n(wrst_n), .ptr(wptr), .q2_ptr(wq2_rptr));
    
    // rptr & empty logic
    Address_Pointer #(addrsize) Read_Pointer(.addr(raddr), .ptr(rptr), .clk(rclk), .rst_n(rrst_n), .state(empty), .c(rinc));
    Flag_Empty #(addrsize) Empty_Flag(.empty(empty), .clk(rclk), .rst_n(rrst_n), .ptr(rptr), .q2_ptr(rq2_wptr));
    
    // wq2_rptr sync
    Synchronizer #(addrsize) sync_wq2(.q2_ptr(wq2_rptr), .clk(wclk), .rst_n(wrst_n), .ptr(rptr));
    
    // rq2_wptr sync
    Synchronizer #(addrsize) sync_rq2(.q2_ptr(rq2_wptr), .clk(rclk), .rst_n(rrst_n), .ptr(wptr));
endmodule

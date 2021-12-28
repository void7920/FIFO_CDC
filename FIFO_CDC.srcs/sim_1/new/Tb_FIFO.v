`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Seok Hoon Choi
// 
// Create Date: 2021/12/28 16:40:24
// Design Name: Testbench FIFO
// Module Name: Tb_FIFO
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


module Tb_FIFO();
    parameter msb = 8;
    parameter depth = 8;
    
    reg wclk, rclk;
    reg wrst_n, rrst_n;
    reg winc, rinc;
    reg [msb-1:0]wdata;
    
    wire [msb-1:0]rdata;
    wire empty, full;
    wire wclken;

    wire [depth-1:0]raddr;
    wire [depth-1:0]waddr;    
    wire [depth:0]rptr;
    wire [depth:0]wptr;
    wire [depth:0]wq2_rptr;
    wire [depth:0]rq2_wptr;
    
    integer i;
    
    FIFO #(msb, depth) sim(rdata, full, empty, wclken, raddr, waddr, rptr, wptr, wq2_rptr, rq2_wptr, wdata, wclk, wrst_n, winc, rclk, rrst_n, rinc);
    
    initial
    begin
        wrst_n = 1'b0;
        rrst_n = 1'b0;
        
        winc = 1'b0;
        rinc = 1'b0;
        
        wdata = 0;
        
        wclk = 1'b0;
        rclk = 1'b0;
    end
    
    initial
    begin
        main;
    end
    
    task main;
        fork
            clk_gen1;
            clk_gen2;
            rst_gen;
            op_proc;
        join
    endtask
    
    task clk_gen1;
        begin
            forever
            begin
                #10
                    wclk = ~wclk;
            end
        end
    endtask
    
    task clk_gen2;
        begin
            forever
            begin
                #25
                    rclk = ~rclk;
            end
        end
    endtask
    
    task rst_gen;
        begin
           # 7
                wrst_n = 1'b1;
           # 298
                rrst_n = 1'b1;
        end
    endtask
    
    task op_proc;
        begin
            for(i=0; i<2**depth; i=i+1)
            begin : WRE
                #(10)
                    winc = 1'b1;
                    wdata = wdata + 1;
                #(10)
                    winc = 1'b0;
            end
            
            #25
            for(i=0; i<2**depth; i=i+1)
            begin : RDE
                #(25)
                    rinc = 1'b1;
                #(25)
                    rinc = 1'b0;
            end
        end
    endtask
endmodule


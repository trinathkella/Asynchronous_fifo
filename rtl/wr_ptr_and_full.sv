`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 09:28:06
// Design Name: 
// Module Name: wr_ptr_and_full
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


module wr_ptr_and_full #(parameter A_WIDTH = 5)
(
    input                    wr_clk,
    input                    wr_rst_n,
    input                    wr_inc,
    input  [A_WIDTH : 0]     gry_rd_ptr_sync,
    output [A_WIDTH : 0]     gry_wr_ptr,
    output [A_WIDTH - 1 : 0] bin_wr_addr,
    output                   full
);

    logic [A_WIDTH : 0] bin_addr_reg;
    
    always_ff @ (posedge wr_clk, negedge wr_rst_n)
    begin
        if(!wr_rst_n)
        begin
            bin_addr_reg    <=  0;
        end
        else if (wr_inc && !full)
        begin
            bin_addr_reg    <= bin_addr_reg + 1;
        end
    end
    
    assign gry_wr_ptr  = bin_addr_reg ^ (bin_addr_reg >> 1);
    assign bin_wr_addr = bin_addr_reg;
    assign full        = (gry_wr_ptr == {~gry_rd_ptr_sync[A_WIDTH : A_WIDTH - 1], gry_rd_ptr_sync[A_WIDTH - 2 : 0]});
 
endmodule

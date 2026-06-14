`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 17:17:16
// Design Name: 
// Module Name: rd_ptr_and_empty
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


module rd_ptr_and_empty #(parameter A_WIDTH = 5)
(
    input                    rd_clk,
    input                    rd_rst_n,
    input                    rd_inc,
    input  [A_WIDTH : 0]     gry_wr_ptr_sync,
    output [A_WIDTH : 0]     gry_rd_ptr,
    output [A_WIDTH - 1 : 0] bin_rd_addr,
    output                   empty
);

    logic [A_WIDTH : 0] bin_addr_reg;
    
    always_ff @ (posedge rd_clk, negedge rd_rst_n)
    begin
        if(!rd_rst_n)
        begin
            bin_addr_reg    <=  0;
        end
        else if (rd_inc && !empty)
        begin
            bin_addr_reg    <=  bin_addr_reg + 1;
        end
    end
    
    assign gry_rd_ptr  =  bin_addr_reg ^ (bin_addr_reg >> 1);
    assign bin_rd_addr =  bin_addr_reg;
    assign empty       =  (gry_wr_ptr_sync == gry_rd_ptr);

endmodule

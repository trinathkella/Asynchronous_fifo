`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 14:05:07
// Design Name: 
// Module Name: fifo_memory
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


module fifo_memory #(parameter D_WIDTH = 32, A_WIDTH = $clog2(D_WIDTH))
(
    input                    wr_clk,
    input                    wr_inc,
    input                    full,
    input  [A_WIDTH : 0]     wr_addr,
    input  [A_WIDTH : 0]     rd_addr,
    input  [D_WIDTH - 1 : 0] wr_data,
    output [D_WIDTH - 1 : 0] rd_data
);

    localparam DEPTH = 1 << A_WIDTH;
    logic [D_WIDTH - 1 : 0] mem [0 : DEPTH - 1];
    
    always_ff @(posedge wr_clk)
    begin
        if(wr_inc && !full)
            mem[wr_addr]    <=  wr_data;
    end
    
    assign rd_data  =   mem[rd_addr];

endmodule

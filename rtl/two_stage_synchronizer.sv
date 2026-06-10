`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 18:19:54
// Design Name: 
// Module Name: two_stage_synchronizer
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


module two_stage_synchronizer #(parameter A_WIDTH = 5)
(
    input  clk,
    input  rst_n,
    input  [A_WIDTH : 0] i_ptr,
    output [A_WIDTH : 0] o_ptr
);

    logic [A_WIDTH : 0] io1, io2;
    
    always_ff @ (posedge clk, negedge rst_n)
    begin
        if(!rst_n)
            {io2, io1}  <=  0;
        else
            {io2, io1}  <=  {io1, i_ptr};
    end
    
    assign o_ptr    =   io2;

endmodule

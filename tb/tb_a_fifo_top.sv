`timescale 1ns / 1ps

module tb_a_fifo_top;
    parameter D_WIDTH = 32, DEPTH = 32;
    
    reg  wr_clk, rd_clk;
    reg  wr_rst_n, rd_rst_n;
    reg  wr_en, rd_en;
    reg  [D_WIDTH - 1 : 0] wr_data;
    
    wire [D_WIDTH - 1 : 0] rd_data;
    wire full, empty;
    
    `include "tasks.vh"
    
    a_fifo_top #(.D_WIDTH(D_WIDTH), .DEPTH(DEPTH))
    dut(
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .wr_rst_n(wr_rst_n),
        .rd_rst_n(rd_rst_n),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .full(full),
        .empty(empty)
    );
    
    // 100 MHz wr_clk
    always #5 wr_clk = !wr_clk;
    // 50 MHz rd_clk
    always #10 rd_clk = !rd_clk;
    
    initial begin
        wr_clk = 1;
        rd_clk = 1;
    end
    
    initial begin
      /* wr_rst_behav_test();
#10   rd_rst_behav_test();
#10   writing_to_fifo();
#10   reading_from_fifo(); */
      t1();
    end
    
endmodule

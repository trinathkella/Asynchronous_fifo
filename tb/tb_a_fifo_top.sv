`timescale 1ns / 1ps

module tb_a_fifo_top;
    parameter D_WIDTH = 32, DEPTH = 32;
    
    async_fifo_inf #(.D_WIDTH(D_WIDTH), .DEPTH(DEPTH)) inf();

    a_fifo_top #(.D_WIDTH(D_WIDTH), .DEPTH(DEPTH))
    dut(
        .wr_clk(inf.wr_clk),
        .rd_clk(inf.rd_clk),
        .wr_rst_n(inf.wr_rst_n),
        .rd_rst_n(inf.rd_rst_n),
        .wr_en(inf.wr_en),
        .rd_en(inf.rd_en),
        .wr_data(inf.wr_data),
        .rd_data(inf.rd_data),
        .full(inf.full),
        .empty(inf.empty)
    );
    
    // 100 MHz wr_clk
    always #5 inf.wr_clk = !inf.wr_clk;
    // 50 MHz rd_clk
    always #10 inf.rd_clk = !inf.rd_clk;
    
    initial begin
        inf.wr_clk = 1;
        inf.rd_clk = 1;
    end

    // Initializing Reset and enables
    initial begin
        inf.wr_rst_n = 1'b0;
        inf.rd_rst_n = 1'b0;
        inf.wr_en    = 1'b0; 
        inf.rd_en    = 1'b0;
        inf.wr_data  = 32'd0;
    end
    
    initial begin
        @(posedge inf.wr_clk);
        inf.wr_rst_n = 1'b1;
        @(posedge inf.rd_clk);
        inf.rd_rst_n = 1'b1;
        repeat(2) @(posedge inf.wr_clk);
        inf.wr_en  = 1'b1;
        inf.wr_data = 32'hFFAA0011;
        @(posedge inf.wr_clk);
        inf.wr_en = 1'b0;
        // Case 1 : Writing until full
        repeat(32)
        begin
            inf.wr_en = 1'b1;
            inf.wr_data = inf.wr_data+1;
            @(posedge inf.wr_clk);
            inf.wr_en = 1'b0;
        end
        // Case 2 : Read until empty
        repeat(32)
        begin
            @(posedge inf.rd_clk);
            inf.rd_en = 1'b1;
            @(posedge inf.rd_clk);
            inf.rd_en = 1'b0;
        end
    end
    
    // Consecutive write and read
    
endmodule

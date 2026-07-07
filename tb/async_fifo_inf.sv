interface async_fifo_inf #(
    parameter D_WIDTH = 32, DEPTH = 32
);
    logic wr_clk, rd_clk;
    logic wr_rst_n, rd_rst_n;
    logic wr_en, rd_en;
    logic [D_WIDTH - 1 : 0] wr_data;
    logic [D_WIDTH - 1 : 0] rd_data;
    logic full, empty;

    clocking wr_cb @(posedge wr_clk);
        output wr_rst_n, wr_en, wr_data;
        input full;
    endclocking

    clocking rd_cb @(posedge rd_clk);
        output rd_rst_n, rd_en;
        input empty, rd_data;
    endclocking

endinterface
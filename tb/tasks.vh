// task t1;
//     
// endtask

task wr_rst_behav_test;
    wr_rst_n = 1'b0;
    @(posedge wr_clk);
    wr_rst_n = 1'b1;
endtask

task rd_rst_behav_test;
    rd_rst_n = 1'b0;
    @(posedge rd_clk);
    rd_rst_n = 1'b1;
endtask

task writing_to_fifo;
    
endtask
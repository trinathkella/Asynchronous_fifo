// task t1;
//     
// endtask

/* task wr_rst_behav_test;
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
   wr_en = 1'b1;
   @(posedge wr_clk)
   begin
      for(int i = 0; i < 32; i++)
         begin
            wr_data = $random;
         end
   end
endtask
    
task reading_from_fifo;
   rd_en = 1'b1;
endtask */

task t1;
    wr_rst_n = 1'b0; rd_rst_n = 1'b0;
    #10 wr_rst_n = 1'b1; rd_rst_n = 1'b1;
    // WRITE
    wr_en = 1'b0;
    rd_en = 1'b0;
    #20 wr_en = 1'b1; //rd_en = 1'b1;
    @(posedge wr_clk)
    begin
        for (int i = 0; i < 32; i++)
        begin
            wr_data = i;
            #10;
        end
    end
    wr_en = 1'b0;
    #20 rd_en = 1'b0;

    #700 $finish;

endtask

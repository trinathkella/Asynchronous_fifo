task t1;
    wr_rst_n = 1'b0; rd_rst_n = 1'b0;
    #10 wr_rst_n = 1'b1; rd_rst_n = 1'b1;    
    // WRITE 
    wr_inc = 1'b0;
    rd_inc = 1'b0;
    #20 wr_inc = 1'b1;
    @(posedge wr_clk)
    begin
        for (int i = 0; i < 32; i++)
        begin
            wr_data = $random;
            #10;
        end
    end
    wr_inc = 1'b0;
    #20 rd_inc = 1'b1;

    #360 $finish;
endtask
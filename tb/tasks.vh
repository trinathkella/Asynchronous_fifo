task wait_wr_cycles(input int n);
    repeat(n)
        @(posedge wr_clk);
endtask

task wait_rd_cycles(input int n);
    repeat(n)
        @(posedge rd_clk);
endtask

task drive_reset;
     wr_rst_n = 1'b0;
     rd_rst_n = 1'b0;
     wr_en = 1'b0; 
     rd_en = 1'b0;
     fork begin
         wait_wr_cycles(3);
         wr_rst_n = 1'b1;
     end begin
         wait_rd_cycles(5);
         rd_rst_n = 1'b1;
     end join
     
endtask

task drive_ens_and_data;
    wr_en = 1'b0;
    wait_wr_cycles(2);
    wr_en = 1'b1;
    wait_wr_cycles(5);
    wr_en = 1'b0;
    wr_data = 32'd1;
    rd_en = 1'b0;
    wait_rd_cycles(1);
    rd_en = 1'b1;
    wait_rd_cycles(2);
    rd_en = 1'b0;
endtask

task check_reset;

    if(empty !== 1)
    begin
        $error("[%0t] RESET CHECK FAILED : empty should be 1", $time);
    end
    else
        $display("[%0t] RESET CHECK PASSED : empty = 1", $time);
    
    if(full !== 0)
    begin
        $error("[%0t] RESET CHECK FAILED : full should be 0", $time);
    end
    else
        $display("[%0t] RESET CHECK PASSED", $time);
   
endtask
task wait_wr_cycles(int n);
    repeat(n)
        @(posedge wr_clk);
endtask

task wait_rd_cycles(int n);
    repeat(n)
        @(posedge rd_clk);
endtask

task drive_reset;
     wr_rst_n = 1'b0;
     rd_rst_n = 1'b0;
     fork begin
         wait_wr_cycles(5);
         wr_rst_n = 1'b1;
     end begin
         wait_rd_cycles(2);
         rd_rst_n = 1'b1;
     end join
     
//        repeat(3)
//            @(posedge wr_clk); 
//        wr_rst_n = 1'b1;
//        repeat(2)
//            @(posedge rd_clk);
endtask

task check_reset;
    if(empty !== 1)
    begin
        $error("[%0t] RESET CHECK FAILED : empty should be 1", $time);
    end
    else
        $display("[%0t] RESET CHECK PASSED", $time);
    
    if(full !== 0)
    begin
        $error("[%0t] RESET CHECK FAILED : full should be 0", $time);
    end
    else
        $display("[%0t] RESET CHECK PASSED", $time);
endtask

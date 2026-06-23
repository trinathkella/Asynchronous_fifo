task drive_reset;
     wr_rst_n = 1'b0;rd_rst_n = 1'b0;
     repeat(3) @(posedge wr_clk);
     wr_rst_n = 1'b1;
     repeat(3) @(posedge rd_clk);
     rd_rst_n = 1'b1;
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

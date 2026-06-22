
task rst(input w_rst, input r_rst);
    wr_rst_n = w_rst;
    rd_rst_n = r_rst;
endtask

task one_write(input [D_WIDTH - 1 : 0] d);
    wr_en   = 1'b1;
    wr_data = d;
endtask

task one_read();
    rd_en = 1'b1;
endtask

task write_full;
    wr_en = 1'b1;
    for(int i = 0; i < DEPTH; i++)
    begin
        @(posedge wr_clk)
        begin
            wr_data = i;
        end 
    end
endtask

task read_empty;
    rd_en = 1'b1;
endtask

module sctb;

    parameter D_WIDTH = 32, DEPTH = 32;
    reg  wr_clk, rd_clk, wr_rst_n, rd_rst_n;
    reg  wr_en, rd_en;
    reg  [D_WIDTH - 1 : 0] wr_data;
    wire [D_WIDTH - 1 : 0] rd_data;
    wire full, empty;
    logic [D_WIDTH - 1 : 0] exp_Q[$];

   
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

   always #5  wr_clk = !wr_clk;
   always #10 rd_clk = !rd_clk;

   initial begin
      wr_clk = 0; rd_clk = 0;
   end

  /*
      Write_Overflow, Read_Overflow,
      Asynchronous Resets, Consecutive Writes and Reads
      Wrap_around and Flush 
  */

   // Test Case 1 : Reset Check
   wr_rst_n = 1'b0;
   rd_rst_n = 1'b0;
   wr_en    = 1'b0;
   rd_en    = 1'b0;
   fork begin
      repeat(5) @(posedge wr_clk);
         wr_rst_n = 1'b1;
      end begin
      repeat(5) @(posedge rd_clk);
        rd_rst_n = 1'b1;
      end join
  ////////////////////////////

  task wr_to_fifo;
     @(posedge wr_clk);
     wr_data = 32'd10;
     repeat(1) @(posedge wr_clk);
     repeat(32) begin
         wr_en = 1'b1;
         exp_Q.push_back(wr_data);
         @(posedge wr_clk) begin
            wr_data = wr_data + 1;
         end
     end
  endtask

endmodule 

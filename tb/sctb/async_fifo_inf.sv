// Interface

interface inf #(parameter D_WIDTH = 32, DEPTH = 32) (input wr_clk, input rd_clk);

   logic wr_rst_n;
   logic rd_rst_n;
   logic wr_en;
   logic rd_en;
   logic [D_WIDTH - 1 : 0] wr_data;
   logic [D_WIDTH - 1 : 0] rd_data;
   logic full;
   logic empty;

endinterface

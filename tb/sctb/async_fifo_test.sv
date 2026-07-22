`timescale 1ns/1ps

`include "async_fifo_inf.sv"
`include "async_fifo_pkg.sv"
`include "../../rtl/a_fifo_top.sv"

module test_top;

	import async_fifo_pkg::*;
	localparam D_WIDTH = 32, DEPTH = 32;

 	inf #(.D_WIDTH(D_WIDTH), .DEPTH(DEPTH)) a_inf(.wr_clk(wr_clk), .rd_clk(rd_clk));

	a_fifo_top #(.D_WIDTH(D_WIDTH), .DEPTH(DEPTH))
	dut(
			.wr_clk(wr_clk),
			.rd_clk(rd_clk),
			.wr_rst_n(a_inf.wr_rst_n),
			.rd_rst_n(a_inf.rd_rst_n),
			.wr_en(a_inf.wr_en),
			.rd_en(a_inf.rd_en),
			.wr_data(a_inf.wr_data),
			.rd_data(a_inf.rd_data),
			.full(a_inf.full),
			.empty(a_inf.empty)
		);

	always #5  wr_clk = !wr_clk;
	always #10 rd_clk = !rd_clk;

	initial begin
		wr_clk = 1'b0;
		rd_clk = 1'b1;
		a_inf.wr_rst_n = 1'b0;
		a_inf.rd_rst_n = 1'b0;
		
		repeat(2) @(posedge wr_clk);
		a_inf.wr_rst_n = 1'b1;
		repeat(1) @(posedge rd_clk);
		a_inf.rd_rst_n = 1'b1;
	end

endmodule : test_top
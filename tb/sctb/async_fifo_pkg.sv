package async_fifo_pkg;
	
	`include "async_fifo_txn.sv"
	`include "async_fifo_wr_gen.sv"
	`include "async_fifo_rd_gen.sv"
	`include "async_fifo_wr_drv.sv"
	`include "async_fifo_rd_drv.sv"
	`include "async_fifo_wr_mon.sv"
	`include "async_fifo_rd_mon.sv"
	`include "async_fifo_scoreboard.sv"
	`include "async_fifo_flag_checker.sv"
	`include "async_fifo_log.sv"

endpackage : async_fifo_pkg
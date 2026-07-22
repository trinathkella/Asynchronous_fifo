`include "async_fifo_txn.sv"

class wr_gen;
	// txn, mailbox required

	transaction wr_t;

	function new();
		wr_t = new();
	endfunction

	task something;
	endtask

endclass : wr_gen
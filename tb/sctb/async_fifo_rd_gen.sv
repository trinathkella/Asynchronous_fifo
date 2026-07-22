`include "async_fifo_txn.sv"

class rd_gen;
	// txn, mailbox are required

	transaction rd_t;

	function new();
		rd_t = new();
	endfunction

	task something;
	endtask

endclass : rd_gen
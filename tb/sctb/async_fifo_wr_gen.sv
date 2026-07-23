// Writing Full Depth
// Writes in between IDLE cycles
// Trying to write when FIFO is full
// ****** Required classes/interfaces for the IPC ******
	/*
		1. Transaction class
		2. Mailbox for IPC
		3. Interface to drive the gen_values to the DUT
	*/
////////////////////////////////////////////////////////

class wr_gen;

	transaction wr_t;
	mailbox g2d_mbox;
	virtual inf v_if;

	function new();
		wr_t    = new();
		g2d_mbox = new();
	endfunction

	task something;
	endtask

endclass : wr_gen
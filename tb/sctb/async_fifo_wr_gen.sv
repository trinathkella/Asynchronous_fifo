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

	function new(virtual inf v_if);
		this.v_if = v_if;
		wr_t    = new();
		g2d_mbox = new();
	endfunction

	task write_full_depth;
		repeat(v_if.DEPTH)
		begin
			wr_t.txn_wr_en 	 = 1'b1;
			wr_t.txn_wr_data = wr_t.txn_wr_data + 1;
		end
	endtask

	task wrs_with_idle_cycles;
		@(posedge v_if.wr_clk);
		wr_t.txn_wr_data <= wr_t.txn_wr_data + 1;
		repeat(2)(@posedge v_if.wr_clk);
		wr_t.txn_wr_data <= wr_t.txn_wr_data
	endtask

	task ilegal_write;
		if(v_if.full)
			wr_t.txn_wr_data <= 32'hDEADBEEF;
	endtask



endclass : wr_gen
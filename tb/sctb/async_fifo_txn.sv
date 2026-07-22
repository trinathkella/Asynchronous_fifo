class transaction;

	rand bit [31 : 0] txn_wr_data;
		 bit [31 : 0] txn_rd_data;
	rand bit 		  txn_wr_en;
	rand bit 		  txn_rd_en;
		 bit		  txn_full;
		 bit		  txn_empty;

    function void display(string tag = "");
    	$display("[%0t] %s txn_wr_data=%0h txn_wr_en=%0b txn_rd_en=%0b txn_full=%0b txn_empty=%0b",
    		$time, tag, txn_wr_data, txn_wr_en, txn_rd_en, txn_full, txn_empty);
	endfunction

endclass : transaction
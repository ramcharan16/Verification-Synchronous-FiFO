//Name :Ramcharan Donikeni

class syn_seq_item extends uvm_sequence_item;
  `uvm_object_utils(syn_seq_item)
  rand bit [7:0] wr_data;
  rand bit wr_en;
  rand bit rd_en;
  bit full;
  bit empty;
  bit [7:0] rd_data;
  bit rd_valid;
  
  function new(string name="syn_seq_item");
    super.new(name);
  endfunction
  
endclass

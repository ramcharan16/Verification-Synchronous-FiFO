//Name:Ramcharan Donikeni

class syn_sequencer extends uvm_sequencer #(syn_seq_item);
  
  `uvm_component_utils(syn_sequencer)
  
  function new(string name="syn_sequencer",uvm_component parent=null);
    super.new(name,parent);
  endfunction
endclass

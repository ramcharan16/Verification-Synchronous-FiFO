//Name:Ramcharan Donikeni



class syn_agent extends uvm_agent;
  `uvm_component_utils(syn_agent);
  syn_sequencer seqr;
  syn_monitor mon;
  syn_driver dri;
  function new(string name="syn_agent",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr=syn_sequencer::type_id::create("seqr",this);
    dri=syn_driver::type_id::create("dri",this);
    mon=syn_monitor::type_id::create("mon",this);
  endfunction
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     dri.seq_item_port.connect(seqr.seq_item_export);
   endfunction
  
  
endclass

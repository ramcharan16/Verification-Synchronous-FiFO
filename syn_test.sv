//Name:Ramcharan Donikeni

class syn_test extends uvm_test;
  `uvm_component_utils(syn_test)
  syn_env env;
  syn_sequence seq;
  
  function new(string name="syn_test",uvm_component parent=null);
    super.new(name,parent);
   
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=syn_sequence::type_id::create("seq");
    env=syn_env::type_id::create("env",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.agent.seqr);
    phase.drop_objection(this);
    
  endtask
  
  

  
  
endclass

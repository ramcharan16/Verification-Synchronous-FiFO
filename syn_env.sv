//Name: Ramcharan Donikeni

`timescale 1ns / 1ps

class syn_env extends uvm_env;
  `uvm_component_utils(syn_env)
  syn_agent agent;
  
  function new(string name="syn_env",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent=syn_agent::type_id::create("agent",this);
  endfunction
  
  
  

  
endclass
  

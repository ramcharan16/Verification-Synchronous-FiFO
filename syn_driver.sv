//Name:Ramcharan Donikeni


class syn_driver extends uvm_driver #(syn_seq_item);
  `uvm_component_utils(syn_driver);
  
  
  syn_seq_item item;
  virtual syn_intf vif;
  
  function new(string name="syn_driver",uvm_component parent=null);
    super.new(name,parent);
  endfunction  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual syn_intf)::get(this, "", "vif", vif))
    `uvm_fatal("NOVIF",{"virtual cpu_twi_intf must be set for :",get_full_name(),".vif"});

    
  endfunction
  virtual task drive();
    if(!vif.rst) begin
     vif.wr_data=item.wr_data;
     vif.wr_en=item.wr_en;
     vif.rd_en=item.rd_en;
    end
  endtask
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      @(posedge vif.clk);
      seq_item_port.get_next_item(item);
      drive();
      seq_item_port.item_done(item);

      
      
    end
    
   
  endtask
  
endclass

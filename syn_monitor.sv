//Name:Ramcharan Donikeni


class syn_monitor extends uvm_monitor;
  `uvm_component_utils(syn_monitor)
    uvm_analysis_port#(syn_seq_item) item_collected_port;
    virtual syn_intf vif;
  
  syn_seq_item item;
  function new(string name="syn_monitor",uvm_component parent=null);
    super.new(name,parent);
    item=new();
    item_collected_port=new("item_collected_port",this);
  endfunction
  
  

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      if(!uvm_config_db#(virtual syn_intf)::get(this, "", "vif", vif))
    `uvm_fatal("NOVIF",{"virtual cpu_twi_intf must be set for :",get_full_name(),".vif"});

    
  endfunction
  

  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      @(posedge vif.clk);
      //if(!vif.rst) begin
      item.full=vif.full;
      item.empty=vif.empty;
      item.rd_data=vif.rd_data;
      item.rd_valid=vif.rd_valid;
      `uvm_info (get_type_name(),$sformatf("rd_data= %d, rd_en=%b",item.rd_data,item.rd_en), UVM_LOW)
      
      item_collected_port.write(item);
      end
    //end
  endtask
  
endclass

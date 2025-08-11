//Name:Ramcharan Donikeni

class syn_sequence extends uvm_sequence#(syn_seq_item);
  `uvm_object_utils(syn_sequence)
  
  function new(string name="syn_sequence");
    super.new(name);
  endfunction

    int write=0;int read=1;

  virtual task body();
    
    syn_seq_item item;
    item=syn_seq_item::type_id::create("item");
  
    repeat(1024) begin
    start_item(item);
      if(write<512) begin
      item.randomize() with {item.wr_en==1;item.rd_en==0;};
      write=write+1;
      read=read+1;
      end
      else if (read>512) begin
        item.randomize() with {item.wr_data==0;item.wr_en==0;item.rd_en==1;};
      end
  
      //`uvm_info (get_type_name(),$sformatf("wr_data= %d, wr_en=%d, rd_en=%b",item.wr_data,item.wr_en,item.rd_en), UVM_LOW)
     finish_item(item);
    get_response(item);
    end
  endtask


  
  
endclass

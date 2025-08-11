//Name:Ramcharan Donikeni


`include "uvm_macros.svh"
import uvm_pkg::*;
`include "syn_package.sv"


module top;
  bit clk;
  bit rst;
  syn_test test;
  syn_intf dut_if(clk,rst);
  syn_FIFO dut(
    .clk(clk),
    .rst(rst),
    .wr_data(dut_if.wr_data),
    .wr_en(dut_if.wr_en),
    .rd_en(dut_if.rd_en),
    .full(dut_if.full),
    .empty(dut_if.empty),
    .rd_data(dut_if.rd_data),
    .rd_valid(dut_if.rd_valid));
  parameter clk_period=10;
  initial begin
    clk=0;
    forever #(clk_period / 2) clk = ~clk;
  end
  initial begin
    rst=1;
    #10 rst=0;
  end

  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #10000 
  $finish;
end
  initial begin
  uvm_config_db#(virtual syn_intf)::set(null, "*", "vif", dut_if);
    run_test("syn_test");
end
  

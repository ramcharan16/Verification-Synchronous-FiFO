//Name:Ramcharan Donikeni
interface syn_intf(input clk,rst);
  bit [7:0] wr_data;
  bit wr_en;
  bit rd_en;
  bit full;
  bit empty;
  bit [7:0] rd_data;
  bit rd_valid;
endinterface

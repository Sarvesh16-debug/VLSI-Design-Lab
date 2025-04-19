module tb_dual_port_bidirectional_ram_16x8();

reg clk , cs_0,cs_1,out_en_0,out_en_1,wr_en_0,wr_en_1;
reg [3:0] add_in_0,add_in_1;

reg [7:0] data_io_0;
reg [7:0] data_io_1;

assign data_io_0=(out_en_0 && !wr_en_0 && cs_0) ? (8'bzzzzzzzz):data_io_0;

assign data_io_1=(out_en_1 && !wr_en_1 && cs_1) ? (8'bzzzzzzzz):data_io_1;

initial begin

  wr_en_0=1; cs_0=1; out_en_0=0;
  #165;
  wr_en_0=0;
  wr_en_1=1; cs_1=1; out_en_1=1; 
  
  #165;
  
  wr_en_1=1; cs_1=1; out_en_1=0;
  wr_en_1=0; cs_0=1; out_en_1=1;
  
  #165;
  $finsih();
  
end
endmodule
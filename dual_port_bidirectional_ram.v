module dual_port_bidirectional_ram_16x8
(

   input clk,
   input cs_0,cs_1,wr_en_0,wr_en_1,out_en_0,out_en_1,
   input [3:0] add_in_0,add_in_1,
   inout [7:0] data_io_0,data_io_1
   );
   
   reg [7:0] tem_reg_0;
   reg [7:0] tem_reg_1;
   
   reg [7:0] mem[15:0];
   
   always @(posedge clk) begin
            
			if ( cs_0 && wr_en_0 )
			   
			   mem[add_in_0] <= data_io_0;
   end
            
	always @( posedge clk) begin
	
	        if (cs_0 && !wr_en_0 )
			    tem_reg_0 <= mem[add_in_0];
	end
	
	assign data_io_0 = ( cs_0 && !wr_en_0 && out_en_0) ? tem_reg_0:8'bzzzzzzzz;
	
	
	always @(posedge clk) begin
            
			if ( cs_1 && wr_en_1 )
			   
			   mem[add_in_1] <= data_io_1;
   end
            
	always @( posedge clk) begin
	
	        if (cs_1 && !wr_en_1 )
			    tem_reg_1 <= mem[add_in_1];
	end
	
	assign data_io_1 = ( cs_1 && !wr_en_1 && out_en_1) ? tem_reg_1:8'bzzzzzzzz;
	endmodule
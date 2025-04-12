`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 14:42:15
// Design Name: 
// Module Name: serial_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module serial_adder(  input clk ,rst , a,b, output reg sum,carry);



reg [1:0] pr_state;
reg [1:0] nx_state;

parameter s0=2'b00 , s1=2'b01 , s2=2'b10 ,  s3=2'b11;

always @(posedge clk)
begin
        if (rst == 1'b1)
        begin
                pr_state <= s0;
        end
        else begin
                 pr_state <= nx_state;
        end
        
        end
        
        
always @(pr_state , a ,b)
begin
       case(pr_state)
         s0: begin
         if ( a==1'b0 & b==1'b0)begin
          nx_state <= s0;
         end
         else if ( a==1'b0 & b==1'b1)begin
          nx_state <= s1;
         end
          else if ( a==1'b1 & b==1'b0)begin
          nx_state <= s1;
         end
         else if ( a==1'b1 & b==1'b1)begin
          nx_state <= s2;
         end
       end
       
       s1: begin
              if ( a==1'b0 & b==1'b0)begin
               nx_state <= s0;
               end 
                 
               else if ( a==1'b0 & b==1'b1)begin
               nx_state <= s1;
               end 
               
               else if ( a==1'b1 & b==1'b0)begin
               nx_state <= s1;
               end 
               
               else if ( a==1'b1 & b==1'b1)begin
               nx_state <= s2;
               end  
       
       end
       
       s2: begin
              if ( a==1'b0 & b==1'b0)begin
               nx_state <= s1;
               end
               
               if ( a==1'b0 & b==1'b1)begin
               nx_state <= s2;
               end 
               
               if ( a==1'b1 & b==1'b0)begin
               nx_state <= s2;
               end 
               
               if ( a==1'b1 & b==1'b1)begin
               nx_state <= s3;
               end   
        
       end
       
       s3: begin
               if ( a==1'b0 & b==1'b0)begin
               nx_state <= s1;
               end
               
                if ( a==1'b0 & b==1'b1)begin
               nx_state <= s2;
               end
               
                if ( a==1'b1 & b==1'b0)begin
               nx_state <= s2;
               end
               
                if ( a==1'b1 & b==1'b1)begin
               nx_state <= s3;
               end
   
       end 
       
       default: begin
                  nx_state <= s0;
       end
       endcase

end


always @(pr_state)
begin

case (pr_state)

s0: begin carry =0; sum=0; end 
s1: begin carry =0; sum=1; end  
s2: begin carry =1; sum=0; end  
s3: begin carry =1; sum=1; end  
 default : begin carry=0; sum=0; end
endcase 

end
 endmodule

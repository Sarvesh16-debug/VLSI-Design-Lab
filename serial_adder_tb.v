`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 15:08:51
// Design Name: 
// Module Name: serial_adder_tb
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


module serial_adder_tb();

reg clk,rst,a,b;
wire sum,carry;

serial_adder uut(clk,rst,a,b,sum,carry);
always 
#5 clk = ~clk;

initial begin
clk=1'b0;
rst=1'b1;

#20 rst=1'b0;

#10 a=0;b=0; #10 a=0;b=1; #10 a=1;b=0; #10 a=1;b=1; #10 a=0;b=0; #10 a=0;b=1; #10 a=1;b=0; #10 a=1;b=1;

#300;
$finish();

end
endmodule

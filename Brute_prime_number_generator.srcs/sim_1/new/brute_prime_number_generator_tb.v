`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 12:18:49
// Design Name: 
// Module Name: brute_prime_number_generator_tb
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


module brute_prime_number_generator_tb();
reg clk=0;
wire[7:0] out;
wire done;
wire[31:0] total_clk;
brute_prime_number_generator dut(clk,out,done,total_clk);

always
#(0.5) clk=~clk;
endmodule

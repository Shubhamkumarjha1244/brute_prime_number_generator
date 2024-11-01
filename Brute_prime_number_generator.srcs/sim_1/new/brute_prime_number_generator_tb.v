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
//reg[7:0] number1;
wire[7:0] out;
wire done;
wire[31:0] total_clk;
wire[7:0] num1;

brute_prime_number_generator dut(clk,out,done,total_clk,num1);
//prime_number_checker dut(clk,number1,out,done,total_clk);
//eight_bit_random_number_generator dut(clk,out);
 
always
#(0.5) clk=~clk;

//initial
//number1=7'b1011001;

endmodule

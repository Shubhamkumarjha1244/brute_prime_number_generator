`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 10:26:46
// Design Name: 
// Module Name: Brute_prime_number_generator
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

module three_invertor_ring_counter(input q1,output out);
wire q2;
not not1(q1,out);
not not2(q2,q1);
not not3(out,q2);
endmodule




module dFF(clk,rst,d,q);
input rst;
input clk,d;
output reg q;
always @(posedge clk)
    if(~rst)
        q=d; 
    else
        q=1'b0;               
endmodule




module random_bit_generator(clk,random_bit);
    input clk;
    output random_bit;
    reg inn=0;
    wire out1,out2;
    three_invertor_ring_counter tir1(inn,out1);
    three_invertor_ring_counter tir2(inn,out2);
    dFF dff1(clk,out1,out2,random_bit);
    
endmodule
    
module eight_bit_random_number_generator(clk,Eight_bit_random_number);
input clk;
output[7:0] Eight_bit_random_number;
genvar p;

generate for(p=0;p<8;p=p+1)
    begin 
        random_bit_generator RBG(clk,Eight_bit_random_number[p]);
    end
    endgenerate
endmodule


module prime_number_checker(clk,start,number1,prime,done,total_clock);
input clk,start;
input[7:0] number1;
output reg[7:0] prime=0;
output reg done=0;
output reg[31:0] total_clock=0;

reg [31:0] clk_time=1'b0;
reg[7:0] counter=0;
reg[7:0] factor=0;
reg start_checking=1;
reg[7:0] num1;


always @(posedge clk)
    if(start==1'b1)
        clk_time=clk_time+1'b1;
    else
        begin
        prime=0;
        done=0;
        total_clock=0;
        counter=0;
        factor=0;
        start_checking=1;
        end



begin

always @(posedge clk)
    if(start==1'b1)
        if(start_checking)
            num1=number1;
        
 always @(posedge clk)
     if(start==1'b1)
        begin
            start_checking=1'b0;
            counter=counter+1;
            if(num1%counter==1'b0)
                factor=factor+1;   
        end
            
 always @(posedge clk)
        if(start==1'b1)
            if (counter==8'b11111111)
                begin
                if(factor==2'b10)
                    begin
                    done=1'b1;
                    if(prime==8'd0)
                            prime=num1;   
                    if(total_clock==32'd0)total_clock=clk_time;
                    end  
                else
                    if(factor>2'b10)
                       start_checking=1'b1;
                factor=1'b0;
                counter=1'b0;
                end
                
                
                      
end
                
  
endmodule
  
  
  module brute_prime_number_generator(clk,start,out,done,total_clk);
  input clk,start;
  output[7:0] out;
  output done;
  output [31:0] total_clk;
  
 
  
  
  eight_bit_random_number_generator ebr(clk,Eight_bit_random_number);
  prime_number_checker pnc(clk,start,Eight_bit_random_number,out,done,total_clk);
  endmodule
  
            
                
            
                
                
                
           
            
                
        




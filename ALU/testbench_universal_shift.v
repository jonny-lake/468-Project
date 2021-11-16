module test_universal;
reg [3:0]in;
reg [1:0]mode;
reg clk, reset, sr, sl;
wire [3:0]out;

initial
begin 
$monitor($time, " Clk=%b, Reset=%d,in=%d,sr=%d,sl=%d,mode=%b, Count=%b", clk, reset,in,sr,sl,mode, out);
end

initial
begin
clk=0;
reset=1;
#3 reset=0;
#4 reset=1;

#10 sr=1; sl=0; mode=0; in =7;

#20 reset =1; mode=3;

#30 mode = 1;

#40 mode = 2;

#50 mode = 0;
#56 reset = 0;



#80 $finish;
end

always #5 clk=~clk;

four_universal_shift test(in,out,clk,sr,sl,reset,mode);
endmodule
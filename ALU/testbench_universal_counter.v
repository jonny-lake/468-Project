module test_universal_counter;
reg count,load,reset,clk;
reg [3:0]din;

wire cout;
wire [3:0]acount;

initial
begin 
$monitor($time, " Clk=%b, Reset=%d,in=%d,load=%b,count=%b,cout=%b, Count=%b", clk, reset,din,load,count,cout, acount);
end

initial
begin
clk=0;
reset=1;
count = 0;

#3 reset=0;
#4 reset=1;

#10 load = 0; count =1; din = 2;

#100 reset =0;
#101 reset =1;
#105 load = 1;
#115 load = 0;
#116 count = 0;
#300 $finish;

end
always #5 clk=~clk;
four_universal_counter test(din,acount,cout,count,load,reset,clk);
endmodule
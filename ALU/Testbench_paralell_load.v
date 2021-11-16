module Test_paralell;
reg clk, reset;
reg [3:0]din;
wire [3:0]qout;
initial
begin
$monitor($time, "clk=%b, reset=%d, din=%d, qout=%d",clk, reset, din, qout);
end
initial
begin
 clk=0;
 reset=1;
 din=0;
#3 reset=0;
#4 reset=1;
#4 din=8;
#20 reset =1;
#20 din = 15;
#155 $finish;
end
always #5 clk=~clk;
paralell_load_asynch test(clk, reset, din, qout);
endmodule

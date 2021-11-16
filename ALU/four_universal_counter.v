module four_universal_counter(din,acount,cout,count,load,reset,clk);
input count,load,reset,clk;
input [3:0]din;
output reg cout;
output reg [3:0]acount;

always @(posedge clk or negedge reset)
begin
if (~reset)
 acount = 4'b0000;
else if (load == 1'b1)
	acount = din;
else if (count ==1'b1)
	if (acount == 15)
	cout = 1'b1;
	else
	acount = acount +1;

else
acount = acount;

end
endmodule
module paralell_load_asynch(clk,reset,din,qout);
input [3:0]din;
input clk,reset;
output reg[3:0]qout;
always @(posedge clk or negedge reset)
begin
if (!reset)
	qout<= 4'b0000;
else
	qout<=din;
end
endmodule

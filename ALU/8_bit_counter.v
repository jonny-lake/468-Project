module eight_counter(clk,reset,count,tick);
input clk,reset;
output[7:0]count;
output tick;
reg[7:0]current;
wire [7:0]next;

always @(posedge clk or negedge reset)
	begin
		if(~reset)
		current <= 0;
		else
		current <= next;
	end
assign next = current+1;
assign count = current;
assign tick =(current == {8{1'b1}})? 1'b1 : 1'b0;
endmodule

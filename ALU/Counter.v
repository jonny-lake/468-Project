module Counter (Clk, Reset, Count);
input Clk, Reset;
output reg[3:0] Count;
always @(posedge Clk)
if (~Reset)
Count=4'b0000;
else
 Count = Count+1;
endmodule

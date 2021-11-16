module four_universal_shift(in,out,clk,sr,sl,reset,mode);
input [3:0]in;
input clk,reset,sr,sl;
input [1:0]mode;
output reg[3:0]out;

always @ (posedge clk or negedge reset)
begin

if (~reset)
	out <= 4'b0000;

else if(mode == 2'b00)
	out <= out;

else if (mode == 2'b01)
	out <= {sr,out[3:1]};

else if (mode == 2'b10)
	out <= {out[2:0],sl};

else if (mode == 2'b11)
	out <= in;
end
endmodule
module zero_detector(in,out);
input [7:0]in;
output reg[7:0]out;

integer i;

always @*
begin
	out=4'b0000;
	for(i=0; i<8; i = i+1)
	begin
	if (in[i] == 0)
	begin
	out = out+1;
	end
end
end
endmodule
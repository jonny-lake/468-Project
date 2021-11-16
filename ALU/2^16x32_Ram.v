module big_ram(enable,readwrite,adress,datain,dataout);
input enable,readwrite;
input[31:0]datain;
input[15:0]adress;
output reg[31:0]dataout;
reg[31:0] Mem[0:65535];
always @ (enable or readwrite)
	if(enable)
		if(readwrite)
			dataout = Mem[adress];
		else
			Mem[adress] = datain;
	else
		dataout = 32'bz;
endmodule


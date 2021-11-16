module eight_sixteen_rom(oeb,data,adress);

parameter Awidth = 8,  Dwidth = 16;
input oeb;
output[Dwidth-1:0]data;
input [Awidth-1:0]adress;
reg[Dwidth-1:0]mem[0:(1<<Awidth)-1];
assign data = (oeb == 1'b0)? mem[adress] : 'bz;
endmodule
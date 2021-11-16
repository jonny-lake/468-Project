module flag_set(s_bit,flag,out);
input s_bit;
input[32:0]out;
output reg[3:0]flag;

always @ *
	if (s_bit==1)
		if(out == 0)
			flag = 4'b0100;
		else
			flag = {out[0],1'b0,out[32],out[32]};
	else
		flag = 4'b0000;
endmodule
	
	
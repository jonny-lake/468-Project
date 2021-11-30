module flag_set(R1,R2,s_bit,instr,out,flag);
input s_bit;
input [3:0]instr;
input[32:0]out,R1,R2;
output reg[3:0]flag;

always @ *
	if (s_bit==1 || instr == 4'b1000)
		if(out==0)
		
			flag = 4'b0100;
		
		else if (instr == 4'b0001 || instr == 4'b1000)
			
			flag = 4'b1000;
			
			
 		else
			flag = {out[0],1'b0,out[32],out[32]};
	else
		flag = flag;
endmodule
	
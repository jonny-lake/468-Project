module compare(R1,R2,out,flag);
input [31:0]R1,R2;
output[3:0]flag;
output[32:0]out;

assign out = R1-R2;
assign flag = (out==0)?4'b0100:{out[0],1'b0,out[32],out[32]};
endmodule
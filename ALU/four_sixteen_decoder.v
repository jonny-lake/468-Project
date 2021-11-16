module four_sixteen_decoder(in,out);
input[3:0]in;
output[15:0]out;
assign out =1'b1<<in;
endmodule

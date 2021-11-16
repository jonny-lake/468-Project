module bit_multiplier(in1,in2,out);
input [31:0]in1,in2;
output [32:0]out;

assign out = in1*in2;
endmodule

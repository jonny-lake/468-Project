module shift_right_register(din,qout);
parameter n=4;
input[31:0]din;
output[31:0]qout;
assign qout = din>>n;
endmodule
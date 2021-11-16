module quiz_three(a,b,sum);
parameter n = 4;

input[n-1:0]a;
input[n-1:0]b;
output reg[n:0]sum;

 assign sum = (a + b );

endmodule
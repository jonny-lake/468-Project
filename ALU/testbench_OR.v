module Test_bitwiseOR;
reg [31:0] in1, in2;
wire [32:0] out;
initial
begin
in1=2; in2=2;
#10 in1=10; in2=10;
#10 in1=6; in2=2;
#10 in1=5; in2=2; 
#10 in1=10; in2=1;  
end
initial
begin
$monitor($time, "1stnum.=%b, 2ndnum.=%b, Sum=%b", in1, in2, out);
end
bitwise_OR test(in1, in2, out);// Add MUT(.Sum(Result), .A(in1), .B(in2));
endmodule

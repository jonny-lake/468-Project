
module Test_rightshift;
reg [31:0] in1;
wire [32:0] out;
initial
begin
in1=2;
#10 in1=20;
#10 in1=60; 
#10 in1=55; 
end
initial
begin
$monitor($time, "1stnum.=%b,  Sum=%b", in1, out);
end
shift_right_register #(4)test(in1, out);// Add MUT(.Sum(Result), .A(in1), .B(in2));
endmodule
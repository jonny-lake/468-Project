module test_quiz_three;
reg [4-1:0] a, b;

wire [4:0]sum;

initial
begin 
	$monitor($time, "1st num.=%d, 2nd num.=%d,Sum=%d", a, b,sum);
end
initial
begin

a=2; b=3; 
#10 a=1; b=3; 
#10 a=10; b=10; 
#10 a=15; b=15; 


end


quiz_three #(4)test(a,b,sum);
endmodule
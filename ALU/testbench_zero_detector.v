module Test_zero;
	reg [7:0] in;
	wire [7:0] Result;
	initial
begin
	in=15; 
	#10 in=1;
	#10 in=3;
	#10 in=20;
	#10 in=7;
	#10 in=8;
end
initial
begin
	$monitor($time, "1st num.=%d, Sum=%d", in, Result);
end

	zero_detector MUT (in,Result);
endmodule

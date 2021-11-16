module Test_parameterized_decoder;
	reg  in;
	wire out;
initial
begin
in=2;
#10 in=1;
#10 in=6;
#10 in=5;
end
initial
begin
	$monitor($time,"in=%b, Out=%d", in, out);
end
	n_m_decoder #(3,8)test(in,out);
endmodule
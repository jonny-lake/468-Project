module testMemory;
	reg [7:0] PC;
	wire [3:0] FLG;
	wire [31:0] dataOut;
	reg fetch;
 
	main main1(PC, FLG, fetch, dataOut);

initial
begin  
$readmemb("data_h.mem", main1.ram1.mem);
  
PC = 8'd0; fetch = 1;
#10 PC = 8'd0; fetch = 1;
#10 PC = 8'd1; fetch = 1;
#10 PC = 8'd2;
#10 PC = 8'd3;
#10 PC = 8'd4;
#10 PC = 8'd5;
#10 PC = 8'd6;
#10 PC = 8'd7;
#10 PC = 8'd8;

$writememh("data_h2.txt", main1.ram1.mem);

end


initial
begin
$monitor($time, "Flag is: %b, data at address %b is %b", FLG, PC, dataOut);
end
endmodule

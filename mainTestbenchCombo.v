module wtf;
	wire [3:0] FLG, dest, OP, s1, s2;
	wire [15:0] PCout;
	wire [31:0] DataOut_toMem, doutMem;
	reg clk, clkDecode, clkExecute, PCreset;
	wire[31:0] DataOut1, DataOut2, DataOut_toRAM, DataOut_toReg,outToRegisterMux, addressOutToRam, dataOut;
	wire[31:0] AddressOut;
	wire Add_bus_sel, LDR_sel, RW_Out, fetch;

	fetch fetch1(.clk(clk), .reset(PCreset), .PCout(PCout), .firstFetch(fetch), .rw(RW_out));
	
	ram ram1(.clk(clkDecode),.rw(RW_Out),.readInstruction(fetch), .addr(addressOutToRam[15:0]), .din(DataOut_toRAM), .dout(DataOut_toMem),.doutMem(doutMem));
	
	// decode decode1(.instruction(DataOut_toMem), .OPcode(OP), .source1(s1), .source2(s2), .destination(dest));

	//register_bank registers1(.Address(dest), .Source1(s1), .Source2(s2), .DataIn(dataOut), .DataOut1(DataOut1), .DataOut2(DataOut2));
	register_bank registers1(.clk(clkDecode),.Address(DataOut_toMem[22:19]), .Source1(DataOut_toMem[18:15]), .Source2(DataOut_toMem[14:11]), .DataIn(dataOut), .DataOut1(DataOut1), .DataOut2(DataOut2));

	simple_ALU ALU1(.clk(clkDecode),.R1(DataOut1),.R2(DataOut2),.instr(DataOut_toMem),.FLG(FLG),.out(outToRegisterMux));

	memory_control control(.clk(clkDecode),.OpCode(DataOut_toMem[27:24]), .Add_bus_sel(Add_bus_sel), .LDR_sel(LDR_sel),.RW_Out(RW_Out));

	//.DataIn_fromRAM(DataOut_toMem)	

	addBusMux addressMux1(.clk(clk),.EN(Add_bus_sel), .addressIn(DataOut1), .pcInstruction(PCout), .addressOut(addressOutToRam));

	regMux registerMux1(.clk(clkDecode),.EN(LDR_sel), .ramData(doutMem), .ALUresult(outToRegisterMux), .dataOut(dataOut));	



initial
begin  
$readmemb("ALU Instruction Set v2.txt", ram1.mem);
$readmemb("reg_b.mem", registers1.regBank);

clk = 0;  PCreset = 1; clkDecode = 0; clkExecute = 0;
#10 clkDecode = 0;
#10 PCreset = 0;

#400 $writememh("data_h2.txt", ram1.mem);

end

always #10 clk = ~clk;
always #10 clkDecode = ~clkDecode;
always #10 clkExecute = ~clkExecute;


initial
begin
$monitor($time, "Flag is: %b, data at address %b is %b, first fetch is %b, reset bit: %b, execute clock: %b, decode clock: %b, fetch clk %b, read/write: %b", FLG, PCout, DataOut_toMem, fetch, PCreset, clkExecute, clkDecode, clk, RW_Out);
end
endmodule

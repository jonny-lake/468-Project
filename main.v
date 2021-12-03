module main(PC, FLG, fetch, DataOut_toMem);
input[7:0] PC;
input fetch;
output [3:0] FLG;
output [31:0] DataOut_toMem;
wire[31:0] DataOut1, DataOut2, DataOut_toRAM, DataOut_toReg,outToRegisterMux, addressOutToRam, dataOut;
wire[15:0] AddressOut;
wire Add_bus_sel, LDR_sel, RW_Out;
	
	ram ram1(.rw(RW_Out),.readInstruction(fetch), .addr(addressOutToRam), .din(DataOut_toRAM), .dout(DataOut_toMem));

	register_bank registers1(.Address(DataOut_toMem[22:19]), .Source1(DataOut_toMem[18:15]), .Source2(DataOut_toMem[14:11]), .DataIn(dataOut), .DataOut1(DataOut1), .DataOut2(DataOut2));

	simple_ALU ALU1(.R1(DataOut1),.R2(DataOut2),.instr(DataOut_toMem),.FLG(FLG),.out(outToRegisterMux));

	memory_control control(.OpCode(DataOut_toMem[27:24]), .Source1(DataOut1), .Source2(DataOut2), .DataIn_fromRAM(DataOut_toMem), .Add_bus_sel(Add_bus_sel), .LDR_sel(LDR_sel), .DataOut_toRAM(DataOut_toRAM), .DataOut_toReg(DataOut_toReg), .RW_Out(RW_Out), .AddressOut(AddressOutToMux));

	addBusMux addressMux1(.EN(Add_bus_sel), .addressIn(AddressOutToMux), .pcInstruction(PC), .addressOut(addressOutToRam));

	regMux registerMux1(.EN(LDR_sel), .ramData(DataOut_toReg), .ALUresult(outToRegisterMux), .dataOut(dataOut));	

endmodule


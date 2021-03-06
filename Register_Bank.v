module register_bank(clk,Address, Source1, Source2, DataIn, DataOut1, DataOut2);
input clk;
input [3:0] Address, Source1, Source2;	// 4-bit inputs from the instruction where address determines the register to be written to, and sources 1 and 2 are the registers to be read from 
input [31:0] DataIn;			// 32-bit data input that is written to a register
output reg [31:0] DataOut1, DataOut2;	// 32-bit data output that is sent to the ALU and the memory control

reg [31:0] regBank [0:15];		// 16 32-bit registers

always @(posedge clk)			// trigger on sensitivity list change
begin					
	regBank[Address] = DataIn;	// DataIn is written to the register determined by Address
	DataOut1 = regBank[Source1];	// The contents at registers determined by sources 1 and 2 are read from the register bank
	DataOut2 = regBank[Source2];
end
endmodule
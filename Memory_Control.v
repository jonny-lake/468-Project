module memory_control(EN, clk, OpCode, Source1, Source2, Add_bus_sel, LDR_sel, DataOut_toRAM, DataOut_toReg, RW_Out, AddressOut);

input EN, clk;				// module enable and clock signal
input [3:0] OpCode;			// Op code to check for LDR and STR functions
input [31:0] Source1, Source2;		// sources 1 and 2 from register bank

output reg Add_bus_sel, LDR_sel, RW_Out;				// Select bits that are sent to the address bus and LDR mux's and a read/write bit that is sent to the RAM
output reg [31:0] DataOut_toRAM, DataOut_toReg, AddressOut;		// Data sent to ram during STR function, data sent to register during LDR function, address sent to address bus mux during STR

always @(posedge clk)
begin
    if(EN)
    begin
        if(OpCode == 4'b1001)				// If LDR or STR are true, set Address bus select and LDR select to true
	begin						// If LDR is true, set RW_Out to 1, Send source 1 to LDR mux
	    Add_bus_sel <= 1'b1;	
	    LDR_sel <= 1'b1;
	    RW_Out <= 1'b1;
	    DataOut_toReg <= Source1;
	    DataOut_toRAM <= 32'bz;
	    AddressOut <= 32'bz;
	end
	else if(OpCode == 4'b1010)			// If STR is true, set RW_Out to 0, send source 1 to address bus mux, send source 2 as data to be written to address(aka source1)
	begin
 	    Add_bus_sel <= 1'b1;
	    RW_Out <= 1'b0;
	    AddressOut <= Source1;
	    DataOut_toRAM <= Source2;
	    DataOut_toReg <= 32'bz;
	end
        else
	begin
	    Add_bus_sel <= 1'b0;	// Else memory control is bypassed until next LDR or STR instruction
	    LDR_sel <= 1'b0;
	    RW_Out <= 1'bz;
	end
    end
    else
    begin
	AddressOut <= 32'bz;		// module disabled, high impedance outputs
	DataOut_toReg <= 32'bz;
	DataOut_toRAM <= 32'bz;
    end
end
endmodule        
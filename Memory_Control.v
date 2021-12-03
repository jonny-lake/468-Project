module memory_control(clk,OpCode, Add_bus_sel, LDR_sel, RW_Out);				
input [3:0] OpCode;
input clk;					// Op code to check for LDR and STR functions
output reg Add_bus_sel, LDR_sel, RW_Out;		// Select bits that are sent to the address bus and LDR mux's and a read/write bit that is sent to the RAM

always @(posedge clk)
begin
case(OpCode)
4'b1001: //LDR
begin
Add_bus_sel = 1'b1; 
LDR_sel = 1'b1; 
RW_Out = 1'b1;
end
4'b1010: //STR
begin
Add_bus_sel = 1'b1; 
RW_Out = 1'b0;
end
default: 
begin
Add_bus_sel = 1'b0; 
LDR_sel = 1'b0;
end
endcase
end

endmodule        
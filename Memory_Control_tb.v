`timescale 1ns/1ns
module memory_control_tb;

reg EN, clk;
reg [3:0] OpCode;
reg [31:0] src1, src2;

wire addr_sel, LDR_sel, RW_out;
wire [31:0] Out_RAM, Out_reg, Out_addr;

memory_control MUT(EN, clk, OpCode, src1, src2, addr_sel, LDR_sel, Out_RAM, Out_reg, RW_out, Out_addr);

initial begin
$monitor($time, "EN=%b, clk=%b, op code: %b, LDR(1) or STR(0)? %b, LDR_sel=%b, src1 = %b, src2 = %b, data to RAM = %b, data to register = %b, addr_sel=%b, output RAM address = %b", 
EN, clk, OpCode, RW_out, LDR_sel, src1, src2, Out_RAM, Out_reg, addr_sel, Out_addr);
end

initial begin

EN = 1'b0;
clk = 1'b0;
OpCode = 4'b1001;
src1 = 32'h00000011;
src2 = 32'h0000001f;

#90

EN = 1'b1;
OpCode = 4'b1010;
src1 = 32'h00001111;
src2 = 32'h00ff00ff;

#20

EN = 1'b1;
OpCode = 4'b0010;
src1 = 32'h00000654;
src2 = 32'h77760000;

#20

EN = 1'b1;
OpCode = 4'b1001;
src1 = 32'h23231111;
src2 = 32'h12345678;

end

always #10 clk = ~clk;

endmodule

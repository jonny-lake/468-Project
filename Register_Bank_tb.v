`timescale 1ns/1ns
module register_bank_tb;

reg EN, clk;
reg [3:0] address, src1, src2;
reg [31:0] Din;

wire [31:0] Dout1, Dout2;

register_bank MUT(EN, clk, address, src1, src2, Din, Dout1, Dout2);

initial begin
$monitor($time, "EN=%b, clk=%b, write reg %d: input=%b, read reg %d: output=%b, read reg %d: output=%b", EN, clk, address, Din, src1, Dout1, src2, Dout2);
end


initial begin

EN = 1'b0;
clk = 1'b0;
address = 4'b0;
src1 = 4'b0;
src2 = 4'b0;
Din = 32'b0;

#90;

EN = 1'b1;
address = 4'b0001;
src1 = 4'b0;
src2 = 4'b0;
Din = 32'h42568399;

#20;

EN = 1'b1;
address = 4'b0010;
src1 = 4'b0001;
src2 = 4'b0;
Din = 32'h002711a8;

#20;

EN = 1'b1;
address = 4'b0011;
src1 = 4'b0010;
src2 = 4'b0001;
Din = 32'h00022231;

end

always #10 clk = ~clk;

endmodule
module decode(instruction, OPcode, source1, source2, destination);
input [31:0] instruction;
output reg [3:0] OPcode, source1, source2, destination;

always @ *
begin
source1 <= instruction[18:15];
source2 <= instruction[14:11];
destination <= instruction[22:19];
OPcode <= instruction[27:24];
end
endmodule

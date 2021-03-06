module addBusMux (clk,EN, addressIn, pcInstruction, addressOut);
    input clk;
    input EN; // enable set as input
    input [31:0] pcInstruction; // address from memory control and PC instruction set as inputs
    input[15:0] addressIn;
    output reg [15:0] addressOut; // ouput address to RAM set as output

    always @(negedge clk) // always updated on input change
    begin
        case(EN)
        1'b0: addressOut = pcInstruction[15:0]; // if (LDR or STR) is false, set address out to PC instruction
        1'b1: addressOut = addressIn[15:0]; // if (LDR or STR) is true, set address out to address in (source 1)
	default: addressOut = pcInstruction[15:0];
        endcase
    end

endmodule
module addBusMux (clk, EN, addressIn, pcInstruction, addressOut);
    input clk, EN; // clock and enable set as inputs
    input [31:0] addressIn, pcInstruction; // address from memory control and PC instruction set as inputs
    output reg [31:0] addressOut; // ouput address to RAM set as output

    always @(posedge clk)  // always updated on clock change
    begin
        case(EN)
        1'b0: addressOut <= pcInstruction; // if (LDR or STR) is false, set address out to PC instruction
        1'b1: addressOut <= addressIn; // if (LDR or STR) is true, set address out to address in (source 1)
        endcase
    end

endmodule
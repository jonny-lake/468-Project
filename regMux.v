module regMux (clk, EN, ramData, ALUresult, dataOut);
    input clk, EN; // clock and enable set as inputs
    input [31:0] ramData, ALUresult; // data from RAM and ALU result set as inputs
    output reg [31:0] dataOut; // output data for register module

    always @(posedge clk) // always updated on clock change
    begin
        case(EN)
        1'b0: dataOut <= ALUresult; // if LDR is not set, ALU result is loaded into register bank
        1'b1: dataOut <= ramData; // if LDR is set, RAM data is loaded into register bank
        endcase
    end
endmodule
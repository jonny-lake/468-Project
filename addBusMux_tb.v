module addBusMux_testbench;
    reg clk, EN;
    reg [31:0] addressIn, pcInstruction;
    wire [31:0] addressOut;
    initial begin
        EN = 1; clk = 1;
        addressIn = 32'h11111111; pcInstruction = 32'h0000000A;
        #20 EN = 0;
        #20 EN = 1;
        #20 EN = 0;
    end
always #10 clk = ~clk;
    initial begin
        $monitor($time, "clock.=%b, Enable.=%b, Address In.=%b, PC Instruction.=%b, Address to RAM.=%b",clk,EN,addressIn,pcInstruction,addressOut);
    end
    addBusMux addBusMux1(clk,EN,addressIn,pcInstruction,addressOut);
endmodule
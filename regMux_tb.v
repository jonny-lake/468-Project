module regMux_testbench;
    reg clk, EN;
    reg [31:0] ramData, ALUresult;
    wire [31:0] dataOut;
    initial begin
        EN = 1; clk = 1;
        ramData = 32'hFFFFFFFF; ALUresult = 32'h00000000;
        #20 EN = 0;
        #20 EN = 1;
        #20 EN = 0;
    end
always #10 clk = ~clk;
    initial begin
        $monitor($time, "clock.=%b, Enable.=%b, Ram Data.=%b, ALU result.=%b, Data to Register Bank.=%b",clk,EN,ramData,ALUresult,dataOut);
    end
    regMux regMux1(clk,EN,ramData,ALUresult,dataOut);
endmodule
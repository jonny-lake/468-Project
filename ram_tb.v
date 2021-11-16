module ram_testbench;
    reg rw, clk ;
    reg[31:0] din;
    reg[15:0] addr;
    wire[31:0] dout;
    initial 
    begin
        rw = 0; clk = 1;
        din = 32'h0000FCAB; addr = 32'h1111ABCD;
        #20 rw = 1; din = 32'h11001100; addr = 32'h1111ABCD;
        #20 rw = 0; din = 32'h00110011; addr = 32'h11110011;
        #20 rw = 1; din = 32'h01011010; addr = 32'h11110011;
    end
always #10 clk = ~clk;
    initial
    begin
        $monitor($time, "clock.=%b, read/write bit.=%b, data in to RAM.=%b, address into RAM.=%b, data out of ram.=%b",clk,rw,din,addr,dout);
    end
    ram r(addr,din,rw,clk,dout);
endmodule
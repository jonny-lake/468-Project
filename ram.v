module ram (clk, rw, readInstruction, addr, din, dout, doutMem);
    input [15:0] addr; // ram address
    input [31:0] din; // ram data in
    input rw, readInstruction, clk; // read-write control (1 for read, 0 for write)
    output reg [31:0] dout, doutMem; // ram data out
    reg [31:0] mem [0:(1 << 16)-1]; // declare an N * W memory array
    always @(posedge clk)
	begin
    	if (readInstruction) dout = mem[addr]; // read from a memory address
	else if(rw)
	begin
	doutMem = mem[addr];
	end
    	else if (~rw) mem[addr] = din; // write to a memory address
    	//else
	//dout <= dout;
        end
endmodule
module ram (addr, din, rw, clk, dout);
    input [15:0] addr; // ram address
    input [31:0] din; // ram data in
    input rw, clk; // read-write control (1 for read, 0 for write), and clock signals
    output reg [31:0] dout; // ram data out
    reg [31:0] ram [0:(1 << 16)-1]; // declare an N * W memory array
    always @(posedge clk)
    if (rw) dout <= ram[addr]; // read from a memory address
    else if (~rw) ram[addr] <= din; // write to a memory address
    else dout <= {32{1'bz}}; // else set to high impedance

endmodule
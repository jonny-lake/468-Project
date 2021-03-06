module fetch(clk, reset, PCout, rw,firstFetch);
input clk, reset, rw;
output reg [15:0] PCout;
output reg firstFetch;

always@(negedge clk)
if(reset) 
begin
firstFetch <= 1'b1;
PCout <= 0;
end
else if(~reset)
begin
if(rw === 1'bz || rw === 1'bx) 
begin
firstFetch <= 1'b1;
PCout <= PCout + 1;
end
else
begin
firstFetch <= 1'b0;
PCout <= PCout + 1;
end
end

endmodule

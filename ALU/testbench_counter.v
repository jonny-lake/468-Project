
module Test_Counter;
reg Clock, Rst;
wire [3:0] Output_Count;
initial
begin
$monitor($time, " Clk=%b, Reset=%d, Count=%d", Clock, Rst, Output_Count);
end
initial
begin
 Clock=0;
 Rst=1;
#3 Rst=0;
#4 Rst=1;
#155 $finish; // allow more than 160 time units for the 16 counts (eachclock pulse is 10 time units)
end
always #5 Clock=~Clock;
Counter MUT(Clock, Rst, Output_Count);
endmodule
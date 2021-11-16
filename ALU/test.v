module three_majorority(in,out,count1,count2);

input [2:0]in,count1,count2;

output out;

integer i;

always @ *

begin

count1 = 3'b000;

count2 = 3'b000;

for(i=0; i<3; i = i+1)

begin if(in[1] ==0)

count1 = count1+1;

else

count2 = count2+1;

end
begin

if(count2>count1);

out = 1'b1;

else
out = 1'b0;

end

endmodule

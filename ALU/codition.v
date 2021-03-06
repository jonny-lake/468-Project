module conditions(cond,flags,out);
input[3:0]cond,flags;
output reg out;

//flags are N Z C V//
always @ *
	begin 
	case(cond)
	default: out = 1'b1;
	4'b0001: out = (flags[2]== 1)? 1'b1:1'b0;
	4'b0010: out = (flags[2] == 0 && flags[3]==flags[0])? 1'b1:1'b0;
	4'b0011: out = (flags[3] != flags[0])?1'b1:1'b0;
	4'b0100: out = (flags[3] == flags[0])?1'b1:1'b0;
	4'b0101: out = (flags[3] == 1 || flags[3]!= flags[0])?1'b1:1'b0;
	4'b0110: out = (flags[1] == 1 && flags[2]==0)?1'b1:1'b0;
	4'b0111: out = (flags[1] == 0)?1'b1:1'b0;
	4'b1000: out = (flags[1] == 1)?1'b1:1'b0;
	endcase
end
endmodule
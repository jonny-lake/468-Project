module simple_ALU(R1,R2,op_code,Imm,Cond,SR_Control,S,FLG,flags,out);
input S;
input [31:0]R1,R2;
input[2:0]SR_Control;
input [3:0]op_code,Cond,flags;
input [15:0]Imm;
output [3:0]FLG;
output reg[32:0]out;


wire w1;
wire [31:0]w2,w3,w4;// helps organize opcode directory

wire [32:0]n1,n2,n3,n4,n5,n6;//this is for non opcode computation
wire [32:0]sr1,sr2,sr3,sr4,sr5,sr6;//this is for 001 opcode computation
wire [32:0]sl1,sl2,sl3,sl4,sl5,sl6;//this is for 010 opcode computation
wire [32:0]rr1,rr2,rr3,rr4,rr5,rr6;//this is for 011 opcode computation


conditions condit(Cond,flags,w1);
shift_right_register #(4)SRR(R2,w2);
shift_left_register #(4)SLR(R2,w3);
rotate_right_register #(4)RRR(R2,w4);

//This section is for op-code 000
 bit_adder none1(R1,R2,n1);
 bit_subtractor none2(R1,R2,n2);
 bit_multiplier none3(R1,R2,n3);
 bitwise_OR none4(R1,R2,n4);
 bitwise_and none5(R1,R2,n5);
 bitwise_XOR none6(R1,R2,n6);

//This section is for op-code 001
 bit_adder op1(R1,w2,sr1);
 bit_subtractor op12(R1,w2,sr2);
 bit_multiplier op13(R1,w2,sr3);
 bitwise_OR op14(R1,w2,sr4);
 bitwise_and op15(R1,w2,sr5);
 bitwise_XOR op16(R1,w2,sr6);

//This section is for op-code 010
 bit_adder op2(R1,w3,sl1);
 bit_subtractor op22(R1,w3,sl2);
 bit_multiplier op23(R1,w3,sl3);
 bitwise_OR op24(R1,w3,sl4);
 bitwise_and op25(R1,w3,sl5);
 bitwise_XOR op26(R1,w3,sl6);

//This section is for op-code 011
 bit_adder op3(R1,w4,rr1);
 bit_subtractor op32(R1,w4,rr2);
 bit_multiplier op33(R1,w4,rr3);
 bitwise_OR op34(R1,w4,rr4);
 bitwise_and op35(R1,w4,rr5);
 bitwise_XOR op36(R1,w4,rr6);


begin
always @ (w1 or SR_Control or S or op_code)
if (w1==0) 
 out = out;
else 
 case({SR_Control,op_code})
 default:out=out;
 7'b0000000: out = n1;//non opcode begins
 7'b0000001: out = n2;
 7'b0000010: out = n3;
 7'b0000011: out = n4;
 7'b0000100: out = n5;
 7'b0000101: out = n6;
 7'b0010000: out = sr1;//opcode 001 begins
 7'b0010001: out = sr2;
 7'b0010010: out = sr3;
 7'b0010011: out = sr4;
 7'b0010100: out = sr5;
 7'b0010101: out = sr6;
 7'b0100000: out = sl1;//opcode 010 begins
 7'b0100001: out = sl2;
 7'b0100010: out = sl3;
 7'b0100011: out = sl4;
 7'b0100100: out = sl5;
 7'b0100101: out = sl6;
 7'b0110000: out = rr1;//opcode 011 begins
 7'b0110001: out = rr2;
 7'b0110010: out = rr3;
 7'b0110011: out = rr4;
 7'b0110100: out = rr5;
 7'b0110101: out = rr6;
endcase
end

assign FLG = (S==1)?((out==0)?4'b0100:{out[0],1'b0,out[32],out[32]}):4'b0000; //setting flags depending on opcode
		
endmodule

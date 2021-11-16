module Test_ALU;
reg S;
reg [31:0]R1,R2;
reg[2:0]SR_Control;
reg [3:0]op_code,Cond,flags;
reg [15:0]Imm;
wire[3:0]FLG;
wire[32:0]out;




initial
begin
S=0; R1=5; R2=3; SR_Control=0; op_code=3; Cond=0; flags=0; Imm=0;
#10 S=0; R1=5; R2=2; SR_Control=0; op_code=1; Cond=0; flags=0; Imm=0;
#10 S=0; R1=3; R2=2; SR_Control=0; op_code=3; Cond=0; flags=0; Imm=0;
end

initial
begin
$monitor($time, "S.=%b,R1.=%d, R2.=%d, SR_control=%b,op_code.=%b,Cond.=%b,flags.=%b,Imm.=%d,FLG.=%b,OUT.=%d", S, R1,R2,SR_Control,op_code,Cond,flags,Imm,FLG,out);
end
simple_ALU test(R1,R2,op_code,Imm,Cond,SR_Control,S,FLG,flags,out);// Add MUT(.Sum(Result), .A(in1), .B(in2));
endmodule
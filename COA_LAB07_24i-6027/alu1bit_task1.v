//halfadder
module halfadder(a,b,s,c);
input a;
input b;
output s;
output c;
xor x1(s,a,b);
and a1(c,a,b);
endmodule

//fulladder
module fulladder(a,b,cin,s,c);
input a;
input b;
input cin;
output s;
output c;
wire t1;
wire t2;
wire t3;
halfadder U1(a,b,t1,t2);
halfadder U2(t1,cin,s,t3);
or o1(c,t2,t3);
endmodule

//and
module logic_and(a,b,c);
input a;
input b;
output c;
and a1(c,a,b);
endmodule

//or
module logic_or(a,b,c);
input a;
input b;
output c;
or a1(c,a,b);
endmodule

//mux
module mux4x1(d0,d1,d2,d3,s1,s0,y);
input d0;//AND 00
input d1;//OR  01
input d2;//10 ADD/SUB
input d3;//11 NOT IN USE
input s1;
input s0;
output y;
wire t1;
wire t0;
wire b0;
wire b1;
wire b2;
wire b3;
not n2(t1,s1);
not n3(t0,s0);
and a0(b0,d0,t1,t0);
and a1(b1,d1,t1,s0);
and a2(b2,d2,s1,t0);
and a3(b3,d3,s1,s0);
or o1(y,b0,b1,b2,b3);
endmodule

//1_bitALU
module alubit1(a,b,cin,b_inv,select,result,cout);
input a;
input b;
input cin;
input b_inv;
input [1:0] select;
output result;
output cout;
wire bout;
wire add_result;
wire or_result;
wire and_result;
xor x1(bout,b_inv,b);
logic_and U4(a,bout,and_result);
logic_or U5(a,bout,or_result);
fulladder U3(a,bout,cin,add_result,cout);
mux4x1 U6(and_result,or_result,add_result,1'b0,select[1],select[0],result);
endmodule

//testbench
module testbench();
reg a;
reg b;
reg cin;
reg b_inv;
reg [1:0] select;
wire result;
wire cout;
alubit1 uut (a,b,cin,b_inv,select,result,cout);
initial
begin
 //  AND
 a=0; b=0; cin=0; b_inv=0; select=2'b00;
#50;
 a=0; b=1; cin=0; b_inv=0; select=2'b00;
#50;
 a=1; b=0; cin=0; b_inv=0; select=2'b00;
#50;
 a=1; b=1; cin=0; b_inv=0; select=2'b00;
#50;
 //  OR
 a=0; b=0; cin=0; b_inv=0; select=2'b01;
#50;
 a=0; b=1; cin=0; b_inv=0; select=2'b01;
#50;
 a=1; b=0; cin=0; b_inv=0; select=2'b01;
#50;
 a=1; b=1; cin=0; b_inv=0; select=2'b01;
#50;
 //  ADD, cin=0
 a=0; b=0; cin=0; b_inv=0; select=2'b10;
#50;
 a=0; b=1; cin=0; b_inv=0; select=2'b10;
#50;
 a=1; b=0; cin=0; b_inv=0; select=2'b10;
#50;
 a=1; b=1; cin=0; b_inv=0; select=2'b10;
#50;
 //  ADD with cin=1
 a=0; b=0; cin=1; b_inv=0; select=2'b10;
#50;
 a=0; b=1; cin=1; b_inv=0; select=2'b10;
#50;
 a=1; b=0; cin=1; b_inv=0; select=2'b10;
#50;
 a=1; b=1; cin=1; b_inv=0; select=2'b10;
#50;
 //  SUB  select=10, b_inv=1, cin=1 => A + ~B + 1
 a=0; b=0; cin=1; b_inv=1; select=2'b10;
#50;
 a=0; b=1; cin=1; b_inv=1; select=2'b10;
#50;
 a=1; b=0; cin=1; b_inv=1; select=2'b10;
#50;
 a=1; b=1; cin=1; b_inv=1; select=2'b10;
#50;
end
endmodule

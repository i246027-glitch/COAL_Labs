//gatelevel
module mux(d0,d1,d2,d3,d4,d5,d6,d7,s2,s1,s0,y); 
input d0; 
input d1; 
input d2; 
input d3; 
input d4; 
input d5; 
input d6; 
input d7; 
input s2; 
input s1; 
input s0; 
output y; 
wire t2;  // NOT s2 
wire t1;  // NOT s1 
wire t0;  // NOT s0 
wire b0;  
wire b1; 
wire b2; 
wire b3; 
wire b4; 
wire b5; 
wire b6; 
wire b7; 
not n1(t2,s2); 
not n2(t1,s1); 
not n3(t0,s0); 
and a0(b0,d0,t2,t1,t0); 
and a1(b1,d1,t2,t1,s0); 
and a2(b2,d2,t2,s1,t0); 
and a3(b3,d3,t2,s1,s0); 
and a4(b4,d4,s2,t1,t0); 
and a5(b5,d5,s2,t1,s0); 
and a6(b6,d6,s2,s1,t0); 
and a7(b7,d7,s2,s1,s0); 
or o1(y,b0,b1,b2,b3,b4,b5,b6,b7); 
endmodule 
module testbench(); 
reg d0; 
reg d1; 
reg d2; 
reg d3; 
reg d4; 
reg d5; 
reg d6; 
reg d7; 
reg s2; 
reg s1; 
reg s0; 
wire y; 
mux unit(d0,d1,d2,d3,d4,d5,d6,d7,s2,s1,s0,y); 
initial 
begin 
d0=1; d1=1; d2=1; d3=1; 
d4=1; d5=1; d6=1; d7=1; 
s2=0; s1=0; s0=0; 
#50 s2=0; s1=0; s0=1; 
#50 s2=0; s1=1; s0=0; 
#50 s2=0; s1=1; s0=1; 
#50 s2=1; s1=0; s0=0; 
#50 s2=1; s1=0; s0=1; 
#50 s2=1; s1=1; s0=0; 
#50 s2=1; s1=1; s0=1; 
end 
endmodule
//dataflow level
module mux(d0,d1,d2,d3,d4,d5,d6,d7,s2,s1,s0,y);
input d0;
input d1;
input d2;
input d3;
input d4;
input d5;
input d6;
input d7;
input s2;
input s1;
input s0;
output y;
wire t2;  // NOT s2
wire t1;  // NOT s1
wire t0;  // NOT s0
wire b0;
wire b1;
wire b2;
wire b3;
wire b4;
wire b5;
wire b6;
wire b7;
assign t2=~s2;
assign t1=~s1;
assign t0=~s0;
assign b0=d0&d2&t1&t0;
assign b1=d1&t2&t1&s0;
assign b2=d2&t2&s1&t0;
assign b3=d3&t2&s1&s0;
assign b4=d4&s2&t1&t0;
assign b5=d5&s2&t1&s0;
assign b6=d6&s2&s1&t0;
assign b7=d7&s2&s1&s0;
assign y=b0|b1|b2|b3|b4|b5|b6|b7;
endmodule
module testbench();
reg d0;
reg d1;
reg d2;
reg d3;
reg d4;
reg d5;
reg d6;
reg d7;
reg s2;
reg s1;
reg s0;
wire y;
mux unit(d0,d1,d2,d3,d4,d5,d6,d7,s2,s1,s0,y);
initial
begin
d0=1; d1=1; d2=1; d3=1;
d4=1; d5=1; d6=1; d7=1;
s2=0; s1=0; s0=0;
#50 s2=0; s1=0; s0=1;
#50 s2=0; s1=1; s0=0;
#50 s2=0; s1=1; s0=1;
#50 s2=1; s1=0; s0=0;
#50 s2=1; s1=0; s0=1;
#50 s2=1; s1=1; s0=0;
#50 s2=1; s1=1; s0=1;
end
endmodule

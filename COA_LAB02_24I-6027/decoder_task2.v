//DECODER(GATE LEVEL) 
module decoder(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7); 
input a; 
input b; 
input c; 
output y0; 
output y1; 
output y2; 
output y3; 
output y4; 
output y5; 
output y6; 
output y7; 
wire an; 
wire bn; 
wire cn; 
not n1(an,a); 
not n2(bn,b); 
not n3(cn,c); 
and g0(y0,an,bn,cn); 
and g1(y1,an,bn,c); 
and g2(y2,an,b,cn); 
and g3(y3,an,b,c); 
and g4(y4,a,bn,cn); 
and g5(y5,a,bn,c); 
and g6(y6,a,b,cn); 
and g7(y7,a,b,c); 
endmodule 
module testbench(); 
reg a; 
reg b; 
reg c; 
wire y0; 
wire y1; 
wire y2; 
wire y3; 
wire y4; 
wire y5; 
wire y6; 
wire y7; 
decoder unit(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7); 
initial 
begin 
a=0; b=0; c=0; 
#50 a=0; b=0; c=1; 
#50 a=0; b=1; c=0; 
#50 a=0; b=1; c=1; 
#50 a=1; b=0; c=0; 
#50 a=1; b=0; c=1; 
#50 a=1; b=1; c=0; 
#50 a=1; b=1; c=1; 
end 
endmodule 
//dataflow level
module decoder(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7);
input a;
input b;
input c;
output y0;
output y1;
output y2;
output y3;
output y4;
output y5;
output y6;
output y7;
wire an;
wire bn;
wire cn;
assign an=~a;
assign bn=~b;
assign cn=~c;
assign y0=an&bn&cn;
assign y1=an&bn&c;
assign y2=an&b&cn;
assign y3=an&b&c;
assign y4=a&bn&cn;
assign y5=a&bn&c;
assign y6=a&b&cn;
assign y7=a&b&c;
endmodule
module testbench();
reg a;
reg b;
reg c;
wire y0;
wire y1;
wire y2;
wire y3;
wire y4;
wire y5;
wire y6;
wire y7;
decoder unit(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7);
initial
begin
a=0; b=0; c=0;
#50 a=0; b=0; c=1;
#50 a=0; b=1; c=0;
#50 a=0; b=1; c=1;
#50 a=1; b=0; c=0;
#50 a=1; b=0; c=1;
#50 a=1; b=1; c=0;
#50 a=1; b=1; c=1;
end
endmodule

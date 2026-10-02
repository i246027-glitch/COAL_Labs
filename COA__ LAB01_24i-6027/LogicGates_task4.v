//BY GATE LEVELLING: 
module LogicGates(a,b,c); 
input a; 
input b; 
output c; 
wire t1; 
wire t2; 
wire t3; 
wire t4; 
not n1(t1,a); 
and a1(t3, t1,b); 
not n2(t2,b); 
and a2(t4,a,t2); 
or o1(c,t3,t4); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
LogicGates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
#50 x=1; y=1; 
end 
endmodule  
/*//BY DATAFLOW LEVELLING: 
module LogicGates(a,b,c); 
input a; 
input b; 
output c; 
wire t1; 
wire t2; 
wire t3; 
wire t4; 
assign t1=~a; 
assign t3=(t1&b); 
assign t2=~b; 
assign t4=(a&t2); 
assign c=(t3|t4); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
LogicGates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
    
#50 x=1; y=1; 
end 
endmodule */

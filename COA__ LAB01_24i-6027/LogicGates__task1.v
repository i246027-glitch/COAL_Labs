//AND GATE: 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
and a1(c,a,b); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
 logicgates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
#50 x=1; y=1; 
end 
endmodule 
//OR GATE: 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
or a1(c,a,b); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
 logicgates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
#50 x=1; y=1; 
end 
endmodule 
//NOT GATE: 
module logicgates(a,c); 
input a; 
output c; 
not a1(c,a); 
endmodule 
module testbench(); 
reg x; 
wire z; 
 logicgates unit(x,z); 
initial 
begin 
x=0; 
#50 x=1;  
end 
endmodule 
//NAND GATE: 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
nand a1(c,a,b); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
 logicgates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
#50 x=1; y=1; 
end 
endmodule 
//NOR GATE: 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
nor a1(c,a,b); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
 logicgates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
#50 x=1; y=1; 
end  
endmodule 
//XOR GATE: 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
xor a1(c,a,b); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
 logicgates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
#50 x=1; y=1; 
end 
endmodule 
//XNOR GATE: 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
xnor a1(c,a,b); 
endmodule 
module testbench(); 
reg x; 
reg y; 
wire z; 
 logicgates unit(x,y,z); 
initial 
begin 
x=0; y=0; 
#50 x=0; y=1; 
#50 x=1; y=0; 
#50 x=1; y=1; 
end 
endmodule

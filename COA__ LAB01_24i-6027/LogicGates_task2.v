//AND GATE (data flow): 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
assign c= a&b ; 
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
//OR GATE (data flow): 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
assign c= a|b ; 
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
//NOT GATE (data flow): 
module logicgates(a,c); 
input a; 
output c; 
assign c= ~a ; 
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
//NAND GATE (data flow): 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
assign c= ~(a&b) ; 
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
//NOR GATE (data flow): 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
assign c= ~(a|b) ; 
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
//XOR GATE (data flow): 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
assign c= a^b ; 
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
//XNOR GATE (data flow): 
module logicgates(a,b,c); 
input a; 
input b; 
output c; 
assign c= a~^b ; 
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
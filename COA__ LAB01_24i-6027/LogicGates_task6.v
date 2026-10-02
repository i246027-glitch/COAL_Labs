//By gate levelling: 
module LogicGates(a3,a2,a1,a0,b3,b2,b1,b0); 
input a0; 
input a1; 
input a2; 
input a3; 
output b0; 
output b1; 
output b2; 
output b3; 
not n1(b0,a0); 
not  n2(b1,a1); 
not n3(b2,a2); 
not n4(b3,a3); 
endmodule 
module testbench(); 
reg A0; 
reg A1; 
reg A2; 
reg A3; 
wire B0; 
wire B1; 
wire B2; 
wire B3; 
LogicGates unit(A0,A1,A2,A3,B0,B1,B2,B3); 
initial 
begin 
A0=0;A1=0;A2=0;A3=0; 
#50 A0=0;A1=0;A2=0;A3=1; 
#50 A0=0;A1=0;A2=1;A3=0; 
#50 A0=0;A1=0;A2=1;A3=1; 
#50 A0=0;A1=1;A2=0;A3=0; 
#50 A0=0;A1=1;A2=0;A3=1; 
#50 A0=0;A1=1;A2=1;A3=0; 
#50 A0=0;A1=1;A2=1;A3=1; 
#50 A0=1;A1=0;A2=0;A3=0; 
#50 A0=1;A1=0;A2=0;A3=1; 
#50 A0=1;A1=0;A2=1;A3=0; 
#50 A0=1;A1=0;A2=1;A3=1; 
#50 A0=1;A1=1;A2=0;A3=0; 
#50 A0=1;A1=1;A2=0;A3=1; 
#50 A0=1;A1=1;A2=1;A3=0; 
#50 A0=1;A1=1;A2=1;A3=1; 
end 
endmodule 
//By dataflow levelling: 
module LogicGates(a3,a2,a1,a0,b3,b2,b1,b0); 
input a0; 
input a1; 
input a2; 
input a3; 
output b0; 
output b1; 
output b2; 
output b3; 
assign b0=~a0; 
assign b1=~a1; 
assign b2=~a2; 
assign b3=~a3; 
endmodule 
module testbench(); 
reg A0; 
reg A1; 
reg A2; 
reg A3; 
wire B0; 
wire B1; 
wire B2; 
wire B3; 
LogicGates unit(A0,A1,A2,A3,B0,B1,B2,B3); 
initial 
begin 
A0=0;A1=0;A2=0;A3=0; 
#50 A0=0;A1=0;A2=0;A3=1; 
#50 A0=0;A1=0;A2=1;A3=0; 
#50 A0=0;A1=0;A2=1;A3=1; 
#50 A0=0;A1=1;A2=0;A3=0; 
#50 A0=0;A1=1;A2=0;A3=1;   
#50 A0=0;A1=1;A2=1;A3=0; 
#50 A0=0;A1=1;A2=1;A3=1; 
#50 A0=1;A1=0;A2=0;A3=0; 
#50 A0=1;A1=0;A2=0;A3=1; 
#50 A0=1;A1=0;A2=1;A3=0; 
#50 A0=1;A1=0;A2=1;A3=1; 
#50 A0=1;A1=1;A2=0;A3=0; 
#50 A0=1;A1=1;A2=0;A3=1; 
#50 A0=1;A1=1;A2=1;A3=0; 
#50 A0=1;A1=1;A2=1;A3=1; 
end 
endmodule 

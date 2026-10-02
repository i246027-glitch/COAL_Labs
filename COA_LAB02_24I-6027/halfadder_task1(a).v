//HALFADDER: GATE FLOW LEVEL 
module halfadder(a,b,s,c); 
input a; 
input b; 
output s; 
output c; 
xor x1(s,a,b); 
and a1(c,a,b); 
endmodule 
module testbench(); 
reg a; 
reg b; 
wire s; 
wire c; 
halfadder unit(a,b,s,c); 
initial 
begin 
    a=0; b=0; 
    #50 a=0; b=1; 
    #50 a=1; b=0; 
    #50 a=1; b=1; 
end 
endmodule 
//HALFADDER: DATA FLOW LEVEL 
module halfadder(a,b,s,c); 
input a; 
input b; 
output s; 
output c; 
assign s=a^b; 
assign c=a&b; 
endmodule 
module testbench(); 
reg a; 
reg b; 
wire s; 
wire c; 
halfadder unit(a,b,s,c); 
initial 
begin 
    a=0; b=0;    
#50 a=0; b=1; 
#50 a=1; b=0; 
#50 a=1; b=1; 
end 
endmodule 

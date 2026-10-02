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
module fulladder(a,b,cin,s,c);
input a;
input b;
input cin;
output s;
output c;
wire t1;//sum
wire t2;//carry
wire t3;
halfadder U1(a,b,t1,t2);
halfadder U2(t1,cin,s,t3);
assign c=t2|t3;
endmodule
module testbench();
reg a;
reg b;
reg cin;
wire s;
wire c;
fulladder unit(a,b,cin,s,c);
initial
begin
a=0;b=0;cin=0;
#50 a=0;b=0;cin=1;
#50 a=0;b=1;cin=0;
#50 a=0;b=1;cin=1;
#50 a=1;b=0;cin=0;
#50 a=1;b=0;cin=1;
#50 a=1;b=1;cin=0;
#50 a=1;b=1;cin=1;
end
endmodule

/*module halfadder(a,b,s,c);
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
*/

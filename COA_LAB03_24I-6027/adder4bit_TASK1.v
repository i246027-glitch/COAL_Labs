//GATELEVEL
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
or(c,t2,t3);
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
module adder4bit(A, B, Sum, Cout);
input  [3:0] A, B;
output [3:0] Sum;
output Cout;
wire t1;
wire t2; 
wire t3;   
halfadder u1(A[0], B[0], Sum[0], t1);          
fulladder u2(A[1], B[1], t1, Sum[1], t2);      
fulladder u3(A[2], B[2], t2, Sum[2], t3);      
fulladder u4(A[3], B[3], t3, Sum[3], Cout);   
endmodule
module testbench();
reg  [3:0] A, B;
wire [3:0] Sum;
wire Cout;
adder4bit unit(A, B, Sum, Cout);
initial begin
 A=4'b0000; B=4'b0000; 
#50 A=4'b0011; B=4'b0001; 
#50 A=4'b0111; B=4'b0010;
#50 A=4'b1010; B=4'b0101; 
#50 A=4'b1111; B=4'b0001; 
#50 A=4'b1111; B=4'b1111;  
end
endmodule
//BEHAVORIAL LEVEL
/*module adder4bit(A,B,Sum_add,Cout_add,Diff_sub,Bout_sub); 
 input  [3:0] A, B;
 output [3:0] Sum_add;   
 output Cout_add;  
 output [3:0] Diff_sub;  
 output Bout_sub; 
 assign {Cout_add, Sum_add} = A + B;
 assign {Bout_sub, Diff_sub} = A - B;
endmodule

module testbench();
reg  [3:0] A, B;
wire [3:0] Sum_add, Diff_sub;
wire  Cout_add;
wire  Bout_sub;

adder4bit unit(A, B, Sum_add, Cout_add, Diff_sub, Bout_sub);

initial 
begin
        A=4'b0000; B=4'b0000; #50; 
        A=4'b0011; B=4'b0001; #50; 
        A=4'b0111; B=4'b0010; #50; 
        A=4'b1010; B=4'b0101; #50; 
        A=4'b1111; B=4'b0001; #50; 
        A=4'b1111; B=4'b1111; #50; 
    end
endmodule
*/
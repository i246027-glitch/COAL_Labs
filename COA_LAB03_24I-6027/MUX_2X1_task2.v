module MUX_2X1(A,B,S,Y);
input  A;
input B;
input S;
output Y;
    assign Y = S ? (A | B) : (A & B);
endmodule

module testbench();
reg A;
reg B;
reg S;
wire Y;
MUX_2X1 unit(A,B,S,Y);     
initial
begin
 A=0; B=0; S=0; 
#50 A=0; B=1; S=0; 
#50 A=1; B=0; S=0;
#50 A=1; B=1; S=0;
#50 A=0; B=0; S=1; 
#50 A=0; B=1; S=1;
#50 A=1; B=0; S=1;
#50 A=1; B=1; S=1;
 end
endmodule
 

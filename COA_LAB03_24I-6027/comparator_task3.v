module comparator(A, B, EQ, GT, LT);
input  [1:0] A, B;
output  EQ;
output GT;
output LT;
assign EQ = (A == B);
assign GT = (A > B);
assign LT = (A < B);
endmodule
module testbench();
reg  [1:0] A, B;
wire EQ;
wire GT;
wire LT;
comparator unit(A, B, EQ, GT, LT);
 initial
 begin
 A=2'b00; B=2'b00; 
#50 A=2'b00; B=2'b01; 
#50 A=2'b01; B=2'b00; 
#50 A=2'b01; B=2'b01; 
#50 A=2'b10; B=2'b01; 
#50 A=2'b01; B=2'b11; 
#50 A=2'b11; B=2'b11; 
end
endmodule


//halfadder
module halfadder(a, b, s, c);
input a;
input b;
output s;
output c;
xor x1(s, a, b);
and a1(c, a, b);
endmodule

//fulladder
module fulladder(a, b, cin, s, c);
input a;
input b;
input cin;
output s;
output c;
wire t1;
wire t2;
wire t3;
halfadder U1(a, b, t1, t2);
halfadder U2(t1, cin, s, t3);
or o1(c, t2, t3);
endmodule

//and
module logic_and(a, b, c);
input a;
input b;
output c;
and a1(c, a, b);
endmodule

//or
module logic_or(a, b, c);
input a;
input b;
output c;
or a1(c, a, b);
endmodule

//mux
module mux4x1(d0, d1, d2, d3, s1, s0, y);
input d0; //AND 00
input d1; //OR  01
input d2; //10 ADD/SUB
input d3; //11 SLT (or 0 for upper bits)
input s1;
input s0;
output y;
wire t1;
wire t0;
wire b0;
wire b1;
wire b2;
wire b3;
not n2(t1, s1);
not n3(t0, s0);
and a0(b0, d0, t1, t0);
and a1(b1, d1, t1, s0);
and a2(b2, d2, s1, t0);
and a3(b3, d3, s1, s0);
or o1(y, b0, b1, b2, b3);
endmodule

//1_bitALU
module alubit1(a, b, cin, b_inv, slt_in, select, result, cout);
input a;
input b;
input cin;
input b_inv;
input slt_in;
input [1:0] select;
output result;
output cout;
wire bout;
wire add_result;
wire or_result;
wire and_result;
xor x1(bout, b_inv, b);
logic_and U4(a, bout, and_result);
logic_or U5(a, bout, or_result);
fulladder U3(a, bout, cin, add_result, cout);
mux4x1 U6(and_result, or_result, add_result, slt_in, select[1], select[0], result);
endmodule

//4_bitALU
module alu4bit(a, b, binv, select, result, CF, SF, ZF, OF);
input [3:0] a;
input [3:0] b;
input binv;
input [1:0] select;
output [3:0] result;
output reg CF;
output SF;
output ZF;
output reg OF;

wire c0, c1, c2, c3;
wire signed_less;


assign signed_less = ($signed(a) < $signed(b));

alubit1 bit0(a[0], b[0], binv, binv, signed_less, select, result[0], c0);
alubit1 bit1(a[1], b[1], c0, binv, 1'b0, select, result[1], c1);
alubit1 bit2(a[2], b[2], c1, binv, 1'b0, select, result[2], c2);
alubit1 bit3(a[3], b[3], c2, binv, 1'b0, select, result[3], c3);

assign SF = result[3];
assign ZF = (result == 4'b0000);

// flags 
always @(*) begin
    CF = 1'b0;
    OF = 1'b0;
    if(select == 2'b10) begin
        if(binv == 1'b0) begin
            CF = c3;
            OF = (~(a[3] ^ b[3])) & (result[3] ^ a[3]);
        end
        else begin
            CF = (a < b);
            OF = (a[3] ^ b[3]) & (result[3] ^ a[3]);
        end
    end
end
endmodule


module tb_alu4bit();
reg [3:0] a;
reg [3:0] b;
reg binv;
reg [1:0] select;
wire [3:0] result;
wire CF, SF, ZF, OF;

alu4bit uut (a, b, binv, select, result, CF, SF, ZF, OF);

initial
 begin
    //  AND (select = 2'b00)
    a = 4'b1010; b = 4'b1100; binv = 0; select = 2'b00;
    #50;
    
    // OR (select = 2'b01)
    a = 4'b1010; b = 4'b1100; binv = 0; select = 2'b01;
    #50;
    
    //  ADD (select = 2'b10, binv = 0)
    a = 4'b0101; b = 4'b0011; binv = 0; select = 2'b10;
    #50;
    
    //  SUB (select = 2'b10, binv = 1)
    a = 4'b0110; b = 4'b0010; binv = 1; select = 2'b10;
    #50;
    
    //  SLT (select = 2'b11) -> Checks if A < B signed
    a = 4'b0010; b = 4'b0101; binv = 0; select = 2'b11;
    #50;
end
endmodule
module program_counter( clk, reset, addr, pc_out);
input clk, reset;
input [3:0] addr;
output reg [3:0] pc_out;
always @ (posedge clk or posedge reset)
begin
    if(reset)
      pc_out <= 4'b0000;
    else
     pc_out <= pc_out + 1;
end
endmodule
module instruction_memory(addr, instruction);
input [3:0] addr;
output reg [7:0] instruction;
reg [7:0] memory [0:15];
initial
begin
memory[0]= 8'b00000000;
memory[1]= 8'b00000001;
memory[2]= 8'b00000010;
memory[3]= 8'b00000011;
memory[4]= 8'b00000100;
memory[5]= 8'b00000101;
memory[6]= 8'b00000110;
memory[7]= 8'b00000111;
memory[8]= 8'b00001000;
memory[9]= 8'b00001001;
memory[10]= 8'b00001010;
memory[11]= 8'b00001011;
memory[12]= 8'b00001100;
memory[13]= 8'b00001101;
memory[14]= 8'b00001110;
memory[15]= 8'b00001111;
end
always @ (addr)
begin
    if ( addr < 16)
      instruction= memory[addr];
    else
      instruction= 8'b00000000;
end
endmodule
module tb_program_counter();
reg clk, reset;
reg [3:0] addr;
wire [3:0] pc_out;
wire [7:0] instruction;
program_counter pc(.clk(clk), .reset(reset), .addr(addr), .pc_out(pc_out));
instruction_memory im(.addr(pc_out), .instruction(instruction));
always begin
#5 clk= ~clk;
end
initial
begin
clk=0;
reset=0;
addr=0;
reset=1;
#10 reset=0;
#10 addr=1;
#10 addr=2;
#10 addr=3;
#10 addr=0;
#10 addr= 4;
#10 addr= 5;
#10 addr= 6;
#10 addr= 7;
#10 addr= 8;
#10 addr= 9;
#10 addr= 10;
#10 addr= 12;
#10 addr= 16;
end
endmodule

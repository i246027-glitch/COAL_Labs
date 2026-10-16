
module program_counter( clk, reset, addr, pc_out);
input clk, reset;
input [3:0] addr;
output reg [31:0] pc_out;
always @ (posedge clk or posedge reset)
begin
    if(reset)
      pc_out <= 32'h00000000;
    else
     pc_out <= pc_out + 4;
end
endmodule
module instruction_memory (
    input [31:0] addr,
    output reg [31:0] instruction
);

reg [31:0] memory [0:15]; // 16 words

initial begin
    memory[0]  = 32'h00000000;
    memory[1]  = 32'h00000001;
    memory[2]  = 32'h00000002;
    memory[3]  = 32'h00000003;
    memory[4]  = 32'h00000004;
    memory[5]  = 32'h00000005;
    memory[6]  = 32'h00000006;
    memory[7]  = 32'h00000007;
    memory[8]  = 32'h00000008;
    memory[9]  = 32'h00000010;
    memory[10] = 32'h00000011;
    memory[11] = 32'h00000012;
    memory[12] = 32'h00000013;
    memory[13] = 32'h00000014;
    memory[14] = 32'h00000015;
    memory[15] = 32'h00000016;
end

always @(*) begin
    instruction = memory[addr[5:2]];  
    // Use bits [5:2] ? divide PC by 4
end

endmodule

module tb_program_counter();
reg clk, reset;
reg [3:0] addr;
wire [31:0] pc_out;
wire [31:0] instruction;
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

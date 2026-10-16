// Adder module: adds 4 to the current PC
module adder (
    input [31:0] pc_in,
    output [31:0] pc_next
);

assign pc_next = pc_in + 4;

endmodule

module program_counter (
    input clk,
    input reset,
    output reg [31:0] pc_out,
    output [3:0] addr   // 4-bit truncated address
);

wire [31:0] pc_next;

// Instantiate Adder
adder add4 (
    .pc_in(pc_out),
    .pc_next(pc_next)
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc_out <= 32'h00000000;   // Reset to base address
    else
        pc_out <= pc_next;        // Update PC using adder output
end

// Truncate PC ? lower bits [5:2] give word index
assign addr = pc_out[5:2];

endmodule
module instruction_memory (
    input [3:0] addr,              // 4-bit address input
    output reg [31:0] instruction
);

reg [31:0] memory [0:15]; // 16 instructions

initial begin
    memory[0]  = 32'h11111111; // 0x00
    memory[1]  = 32'h22222222; // 0x04
    memory[2]  = 32'h33333333; // 0x08
    memory[3]  = 32'h44444444; // 0x0C
    memory[4]  = 32'h55555555; // 0x10
    memory[5]  = 32'h66666666; // 0x14
    memory[6]  = 32'h77777777; // 0x18
    memory[7]  = 32'h88888888; // 0x1C
    memory[8]  = 32'h99999999; // 0x20
    memory[9]  = 32'hAAAAAAAA; // 0x24
    memory[10] = 32'hBBBBBBBB; // 0x28
    memory[11] = 32'hCCCCCCCC; // 0x2C
    memory[12] = 32'hDDDDDDDD; // 0x30
    memory[13] = 32'hEEEEEEEE; // 0x34
    memory[14] = 32'hFFFFFFFF; // 0x38
    memory[15] = 32'h12345678; // 0x3C
end

always @(*) begin
    instruction = memory[addr]; // Directly use 4-bit addr
end

endmodule
module tb_counter_program();

reg clk, reset;
wire [31:0] pc_out;
wire [3:0] addr;
wire [31:0] instruction;

// Instantiate Program Counter (with adder inside)
program_counter pc (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out),
    .addr(addr)
);

// Instantiate Instruction Memory
instruction_memory im (
    .addr(addr),
    .instruction(instruction)
);

// Clock generation
always begin
    #5 clk = ~clk; // Toggle every 5 time units
end

initial begin
    clk = 0; reset = 0;

    // Reset PC
    reset = 1;
    #10 reset = 0;


end

endmodule

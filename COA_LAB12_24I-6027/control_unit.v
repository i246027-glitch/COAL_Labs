module control_unit (
    input clk,
    input rst,
    input [2:0] opcode,

    output reg [2:0] alu_control,
    output reg write_enable,
    output reg select_data_source,
    output reg pc_inc,
    output reg clr
);

    parameter RESET   = 2'b00;
    parameter FETCH   = 2'b01;
    parameter DECODE  = 2'b10;
    parameter EXECUTE = 2'b11;

    reg [1:0] current_state;
    reg [1:0] next_state;

    always @(posedge clk or posedge rst) begin
        if(rst)
            current_state <= RESET;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case(current_state)
            RESET   : next_state = FETCH;
            FETCH   : next_state = DECODE;
            DECODE  : next_state = EXECUTE;
            EXECUTE : next_state = FETCH;
            default : next_state = RESET;
        endcase
    end

    always @(*) begin

        alu_control = 3'b000;
        write_enable = 0;
        select_data_source = 0;
        pc_inc = 0;
        clr = 0;

        case(current_state)

            RESET: begin
                clr = 1;
            end

            FETCH: begin
                clr = 0;
                pc_inc = 0;
                write_enable = 0;
            end

            DECODE: begin
                alu_control = opcode;
            end

            EXECUTE: begin
                write_enable = 1;
                select_data_source = 0;
                pc_inc = 1;
            end

        endcase
    end

endmodule

module control_unit_tb;

    reg clk;
    reg rst;
    reg [2:0] opcode;

    wire [2:0] alu_control;
    wire write_enable;
    wire select_data_source;
    wire pc_inc;
    wire clr;

    control_unit uut (
        .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .alu_control(alu_control),
        .write_enable(write_enable),
        .select_data_source(select_data_source),
        .pc_inc(pc_inc),
        .clr(clr)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        opcode = 3'b000;

        #10;
        rst = 0;

        opcode = 3'b000;//ADD
        #10;

        opcode = 3'b001;//SUB
        #10;

        opcode = 3'b010;//AND
        #10;

        opcode = 3'b011;//OR
        #10;

        opcode = 3'b100;//XOR
        #10;

        opcode = 3'b101;//SHIFT
        #10;

        opcode = 3'b110;//LOAD
        #10;

        opcode = 3'b111;//JUMP
        #10;

      

    end

endmodule

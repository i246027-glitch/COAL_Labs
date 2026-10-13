module aluNbehav #(parameter N=8)( 
    input [N-1:0] a, b, 
    input [2:0] op, 
    output reg [N-1:0] result 
); 
    always @(*) begin 
        case(op) 
            3'b000: result = a + b; 
            3'b001: result = a - b; 
            3'b010: result = a & b; 
            3'b011: result = a | b; 
            3'b100: result = ~a; 
            3'b101: result = a ^ b; 
            default: result = {N{1'b0}}; 
        endcase 
    end 
endmodule 

module testbench(); 
    parameter N = 8; 
    reg [N-1:0] a, b; 
    reg [2:0] op; 
    wire [N-1:0] result; 
    integer i; 
    
    aluNbehav #(.N(N)) uut (a, b, op, result); 
    
    initial begin 
        a = 0; 
        b = 0; 
        op = 0; 
        
        for(i = 0; i < 6; i = i + 1) begin 
            a = 15; 
            b = 3; 
            op = i; 
            #10; 
        end 
    end 
endmodule

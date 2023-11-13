module ALU (
	input [2:0] a,
	input [2:0] b,
	input [1:0] mode, // 00 does add, 01 does sub, 10 does xor, 11 does and
	input c_in,
	output c_out,
	output [2:0] result
);

	reg [2:0] b_new;
	reg [2:0] my_result; // internal result register
	reg c_in_new;
	wire [2:0] sum_out; // from ripple carry adder

	// Adjust b and carry-in based on mode and compute XOR and AND operations
	always @(*) begin
    	case(mode)
        	2'b00: begin
            	b_new = b;
            	c_in_new = c_in;
            	my_result = 3'b000; // placeholder
        	end
        	2'b01: begin
            	b_new = ~b;
            	c_in_new = 1'b1;
            	my_result = 3'b000; // placeholder
        	end
        	2'b10: my_result = a ^ b; // XOR operation
        	2'b11: my_result = a & b; // AND operation
        	default: begin
            	b_new = b;
            	c_in_new = c_in;
            	my_result = 3'b000; // default value
        	end
    	endcase
	end

	ripple_carry_adder my_rca (
    	.c_in(c_in_new),
    	.a(a),
    	.b(b_new),
    	.sum(sum_out),
    	.c_out(c_out)
	);

	// Continuous assignment to drive result
	assign result = (mode < 2'b10) ? sum_out : my_result; // Use sum_out for add and sub, else use my_result

endmodule

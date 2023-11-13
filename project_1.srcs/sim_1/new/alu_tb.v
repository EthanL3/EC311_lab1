
module ALU_testbench;

// Define inputs and outputs
reg [2:0] A;
reg [2:0] B;
reg [1:0] Mode;
reg C_in;
wire C_out;
wire [2:0] Result;

// Instantiate the ALU module
ALU myALU (
	.a(A),
	.b(B),
	.mode(Mode),
	.c_in(C_in),
	.c_out(C_out),
	.result(Result)
);

// Initialize signals
initial begin
	// Add 2 +1
	A = 3'b010;
	B = 3'b001;
	Mode = 2'b00; //add
	C_in = 1'b0;  
	#10;

	// Add 2+3
	A = 3'b010;
	B = 3'b011;
	Mode = 2'b00; //add
	C_in = 1'b0;  
	#10;

	// Subtract 5-2
	A = 3'b101;
	B = 3'b010;
	Mode = 2'b01;
	C_in = 1'b0;
	#10;

	// Subtract 2-1
	A = 3'b010;
	B = 3'b001;
	Mode = 2'b01;
	C_in = 1'b0;
	#10;

	// XOR 6 and 3
	A = 3'b110;
	B = 3'b011;
	Mode = 2'b10;
	C_in = 0;
	#10;

  // XOR 2 and 3
	A = 3'b010;
	B = 3'b011;
	Mode = 2'b10;
	C_in = 0;
	#10;

	// AND 6 and 3
	A = 3'b110;
	B = 3'b011;
	Mode = 2'b11;
	C_in = 0;
	#10;

	// AND 1 and 3
	A = 3'b001;
	B = 3'b011;
	Mode = 2'b11;
	C_in = 0;
	#10;

	$finish;
end

// Monitor outputs
always @(posedge Mode or posedge A or posedge B or posedge C_in) begin
	$display("A = %b, B = %b, Mode = %b, C_in = %b, Result = %b, C_out = %b", A, B, Mode, C_in, Result, C_out);
end

endmodule

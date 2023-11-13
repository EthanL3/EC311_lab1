module ripple_carry_adder(
	input c_in,
	input [2:0] a,
	input [2:0] b,
	output [2:0] sum,
	output c_out
);

	wire w1, w2, w3;
	//instantiate full_adder 1
	full_adder fa1 (
	.c_in(c_in),
	.a(a[0]),
	.b(b[0]),
	.sum(sum[0]),
	.c_out(w1) //connects wire 'w1' to the module's sum output
	);
    
	full_adder fa2 (
	.c_in(w1),
	.a(a[1]),
	.b(b[1]),
	.sum(sum[1]),
	.c_out(w2) //connects wire 'w1' to the module's sum output
	);
    
	full_adder fa3 (
	.c_in(w2),
	.a(a[2]),
	.b(b[2]),
	.sum(sum[2]),
	.c_out(w3) //connects wire 'w1' to the module's sum output
	);

	//a full adder must also have an or gate
	//output sum
	assign c_out = w3;
    

    

endmodule   

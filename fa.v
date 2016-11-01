`timescale 1ns / 1ns

module fa #(parameter n = 1) (output [n - 1 : 0] o, output co, input [n - 1 : 0] a, b, input ci);
	wire [n : 0] sum;
	assign sum = a + b + ci;
	generate
		genvar i;
		for(i = 0; i < n; i = i + 1)
			assign #(10 + i * 7, 9 + i * 7) o[i] = sum[i];
	endgenerate
	assign #(10 + n * 7, 9 + n * 7) co = sum[n];
endmodule

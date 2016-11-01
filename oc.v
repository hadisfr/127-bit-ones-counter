`timescale 1ns / 1ns
`include "fa.v"

module oc #(parameter n = 6) (output [n : 0] out, input [0 : 2 ** (n + 1) - 2] in);
	wire c[1 : 2 ** n];
	wire [n - 1 : 0] w[1 : 2 ** n];
	assign out = {c[1], w[1]};
	generate
		genvar i, j;
		for(i = 0; i < n; i = i + 1) begin
				for(j = 2 ** i; j < 2 ** (i + 1); j = j + 1) begin
					if(i < n - 1)
						fa #(n - i) fast_adder(w[j][n - i - 1 : 0], c[j], {c[2 * j], w[2 * j][n - i - 2 : 0]}, {c[2 * j + 1], w[2 * j + 1][n - i - 2 : 0]}, in[j - 1]);
					else
						fa #(n - i) fast_adder(w[j][n - i - 1 : 0], c[j], in[2 * j - 1], in[2 * j + 1 - 1], in[j - 1]);
				end
		end
	endgenerate
endmodule

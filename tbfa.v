`timescale 1ns / 1ns
`include "fa.v"

module tb_fa;
	parameter n = 4, m = 10;
	reg [n - 1 : 0] a, b;
	reg ci;
	wire [n - 1 : 0] o;
	wire co;
	integer seed = 10'b1000, sum;
	fa #4 fulladder(o, co, a, b, ci);
	initial begin
		$dumpvars(1, fulladder);
		$display("  a\t b\tc_in\t o\tc_out\t\t sum\n______________________________________________________________\n");
		repeat (m) begin
			a = $random(seed);
			b = $random(seed);
			ci = $random(seed);
			#(10 + n * 7 + 20)
			sum = a + b + ci;
			if({co, o} !== sum)
				$display(" %b\t%b\t  %b\t%b\t  %b\t\t%b\n", a, b, ci, o, co, sum [n : 0]);
		end
		$stop;
		$finish;
	end
endmodule

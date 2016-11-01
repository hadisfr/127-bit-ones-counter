`timescale 1ns / 1ns
`include "oc.v"

module tb_oc;
	reg [126 : 0] in;
	wire [6 : 0] out;
	integer seed = 10'b100, i;
	parameter d = 1000;
	oc #6 onecounter(out, in);
	initial begin
		$monitor("@%5d\t:\t%b = %d\t<-\t%h", $time, out, out, in);
		$dumpvars(1, onecounter);
		repeat (100)
			#d in = $random(seed);
		#d
		$display("\n\nMarching 1");
		#d in = 127'b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
		repeat(254) begin
			#d in = {~in[0], in[126 : 1]};
		end
		#d;
		$stop;
		$finish;
	end
endmodule

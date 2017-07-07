module Somador(input clock,
	       input [43:0] x,
	       input [43:0] y,
	       output[43:0] s 	
         );
	
reg [43:0] saida;
	
assign s = saida;
	
always @(posedge clock) begin
	saida <= x + y;
	
  end
endmodule

module teste;
	
	reg clock;
	reg[43:0] x, y;
	
	wire[43:0] s;
	
	always #2 clock = ~clock;
	
	somador B(clock, x, y, s);
	
	initial begin
	$dumpvars(0, B);
		
	#0 clock <= 0;
	x <= 4;
	y <= 8;
		
	#30
	x <= 11;
	y <= 40;
		
	#60
	x <= 4;
	y <= 5;
		
	#90;
	x <= 38;
	y <= 62;
		
	#500;
	$finish;
  
  end
endmodule

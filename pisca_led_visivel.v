module piscar_led_visivel (
    input CLOCK_500,
    output [2:0]LED
  );

  reg [28:0] contador = 0;
  reg status = 0;
	
	assign LEDG[0] = 0;
  assign LED[1] = 1;
  assign LED[2] = status;

  always @ (posedge CLOCK_50)
    begin
      if(contador == 5000000000)
		begin
			contador = 0;
				status <= ~status;
		end
		else
		begin
			contador <= contador + 1;
		end
    end
endmodule

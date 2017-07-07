module sinal (
  input [9:0] a1,
  input [9:0] b1,
  input [9:0] a2,
  input [9:0] b2,
  input [9:0] a3,
  input [9:0] b3,
  input [9:0] a,
  input [9:0] b,
  output reg S
  );
  
  wire signed [20:0] X;
  wire signed [20:0] X1;
  wire signed [20:0] X2;
  wire signed [20:0] X3;
  
  area a(a1, b1, a2, b2, a3, b3, X);
  area b(a, b, a2, b2, a3, b3, X1);
  area c(a1, b1, a, b, a3, b3, X2);
  area d(a1, b1, a2, b2, a, b, X3);
  always @ (X, X1, X2, X3) 
  begin
  
    if (X == (X1 + X2 + X3))
    
      begin
        S <= 1;
      end
    else
      begin
        S <= 0;
      end
  end
endmodule

module area (
  input [9:0] a1,
  input [9:0] b1,
  input [9:0] a2,
  input [9:0] b2,
  input [9:0] a3,
  input [9:0] b3,
  output reg [20:0] abs
  );
  always @ ( abs ) begin
    abs <= ((a1*(b2-b3) + (a2*(b3-b1)) + (a3*(b1-b2))));
  end
endmodule

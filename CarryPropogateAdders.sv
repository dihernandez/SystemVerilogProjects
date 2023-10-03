module RippleCarryAdder #(parameter ADDR_WIDTH = 16) (
  input logic[ADDR_WIDTH - 1:0] a, b,
  input logic c_in,
  output logic[ADDR_WIDTH -1:0] sum.
  output logic c_out
);
  integer it 0;
  wire A, B, C_IN, SUM, C_OUT;
  
  FullAdder fadders[ADDR_WIDTH - 1:0](A, B, C_IN, SUM, C_OUT);
  
  always_comb begin
    for (it 0; it < ADDR_WIDTH; it it + 1) begin
      A <= a[it];
      B <= b[it];
      if (it == 0) begin
        C_IN <= c_in;
      end else begin
      	C_IN <= C_OUT;
      end
    end
    c_out <= C_OUT;
  end
endmodule

module FullAdder(
  input logic a, b, c_in,
  output logic sum, c_out);

  assign sum = a ^ b ^ c_in;
  assign c_out = ((a ^ b) & c_in) | (a&b);
endmodule

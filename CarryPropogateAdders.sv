module RippleCarryAdder #(parameter ADDR_WIDTH = 16) (
  input logic[ADDR_WIDTH - 1:0] a, b,
  input logic c_in,
  output logic[ADDR_WIDTH -1:0] sum,
  output logic c_out
);
  wire [ADDR_WIDTH:0] carry;
  
  assign carry[0] = c_in;
  
  genvar it;
  generate
    for (it = 0; it < ADDR_WIDTH; it = it + 1) begin
      FullAdder fa(.a(a[it]), .b(b[it]), .c_in(carry[it]), .sum(sum[it]), .c_out(carry[it + 1]));
    end
  endgenerate
  
  assign c_out = carry[ADDR_WIDTH];
endmodule

module CarryLookaheadAdder #(parameter ADDR_WIDTH = 16) (
  input logic[ADDR_WIDTH - 1:0] a, b,
  input logic c_in,
  output logic[ADDR_WIDTH - 1:0] sum,
  output logic c_out
); 

  wire[ADDR_WIDTH:0] carry;
  wire [ADDR_WIDTH - 1:0] gen, propogate;
  
  assign carry[0] = c_in;
  
  genvar it;
  generate
    for (it = 0; it < ADDR_WIDTH; it = it + 1) begin
      FullAdder fa(a[it], b[it], carry[it], sum[it]);
    end
  endgenerate
  
  genvar ii;
  generate
    for (ii = 0; ii < ADDR_WIDTH; ii = ii + 1) begin
      assign gen[ii] = a[ii] & b[ii];
      assign propogate = a[ii] | b[ii];
      assign carry[ii + 1] = gen[ii] | (propogate[ii] & carry[ii]);
    end
  endgenerate
  
  assign c_out = carry[ADDR_WIDTH];
endmodule

module FullAdder(
  input logic a, b, c_in,
  output logic sum, c_out);

  assign sum = a ^ b ^ c_in;
  assign c_out = ((a ^ b) & c_in) | (a&b);
endmodule

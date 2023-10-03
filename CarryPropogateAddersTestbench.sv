module CPA_testbench();
  
  logic clk;
  integer addr_width 32;
  logic[addr_width - 1:0] a, b, sum;
  logic c_in, c_out;
  
  always begin
  	clk = 1; #5;
    clk = 0; #5;
  end
  
  RippleCarryAdder #(addr_width) rca(a, b, c_in, sum, c_out);
  
endmodule

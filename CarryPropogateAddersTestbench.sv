module CPA_testbench();
  
  logic clk;
  integer addr_width 4;
  logic[addr_width - 1:0] a, b, sum;
  logic c_in, c_out;
  
  always begin
  	clk = 1; #5;
    clk = 0; #5;
  end
  
  RippleCarryAdder #(addr_width) dut_rca(a, b, c_in, sum, c_out);
  
  initial begin
  	// Add 4+5 no carry in
    c_in <= 0;
    a. <= 4;
    b <= 5;
    #10;
    $display("case 1, sum is %b, c_out is %b", sum, c_out);
    // Add 1 + 0 with carry in
    c_in <= 1;
    a <= 1;
    b <= 0;
    #10;
    $display("case 2, sum is %b, c_out is %b", sum, c_out);
    // Add 1 to 15 with a carry in
    c_in <= 1;
    a <= 15;
    b <= 1;
    #10;
    $display("case 1, sum is %b, c_out is %b", sum, c_out);
  end
endmodule

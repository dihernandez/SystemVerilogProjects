module CPA_testbench();
  logic clk;
  logic[3:0] a, b, rca_sum, cla_sum;
  logic c_in, rca_c_out, cla_c_out;
  
  always begin
  	clk = 1; #5;
    clk = 0; #5;
  end
  
  RippleCarryAdder #(4) dut_rca(a, b, c_in, rca_sum, rca_c_out);
  CarryLookaheadAdder #(4) dut_cla(a, b, c_in, cla_sum, cla_c_out);
  
  initial begin
  	// Add 4+5 no carry in
    c_in <= 0;
    a <= 4;
    b <= 5;
    #10;
    $display("case 1, rca_sum is %d, cla_sum is %d, rca_c_out is %b, cla_c_out is %b", rca_sum, cla_sum, rca_c_out, cla_c_out);
    // Add 1 + 0 with carry in
    c_in <= 1;
    a <= 1;
    b <= 0;
    #10;
    $display("case 2, rca_sum is %d, cla_sum is %d, rca_c_out is %b, cla_c_out is %b", rca_sum, cla_sum, rca_c_out, cla_c_out);
    // Add 1 to 15 with a carry in
    c_in <= 1;
    a <= 15;
    b <= 1;
    #10;
    $display("case 3, rca_sum is %d, cla_sum is %d, rca_c_out is %b, cla_c_out is %b", rca_sum, cla_sum, rca_c_out, cla_c_out);
  end
endmodule

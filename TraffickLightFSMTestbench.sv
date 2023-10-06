module TraffickLightsFSMTestbench();
  logic clk, reset, TA, TB;
  logic [1:0] LA, LB;
  
  parameter GREEN = 2'b00;
  parameter YELLOW = 2'b01;
  parameter RED  = 2'b10;
  
  forever begin
  	clk <= 1; #5;
    clk <= 0; #5;
  end
  
  TraffickLightsFSM dut(clk, reset, TA, TB, LA, LB);
  
  initial begin
  	// get to state 2 then reset
    TA <= 1'b1;
    #10; // one clock cycle state should be S1 after
    #10; // get to S2
    reset <= 1'b1;
    #10;
    if(LA !== GREEN | LB !== RED) begin
      $display("ERROR, not in state S0);
    end
  end
  
endmodule

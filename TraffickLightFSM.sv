module TraffickLightsFSM(input logic clk, reset, TA, TB, 
                         output logic[1:0] LA, LB);

  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter s2 = 2'b10;
  parameter S3 = 2'b11;
  
  parameter GREEN = 2'b00;
  parameter YELLOW = 2'b01;
  parameter RED  = 2'b10;

  logic[1:0] state, next_state;
  
  always_ff (@posedge clk) begin
    if(reset) begin
    	next_state <= S0;
    end else begin
      case(state)
        S0:
          if(TA)
            next_state <= S0;
          else
            next_state <= S1;
        S1:
          next_state <= S2;
        S2:
          if(TB)
          	next_state <= S2;
          else
            next_state <= S3;
        S3:
          next_state <= S0;
      endcase
    end
  	
  end
  
  always_comb begin
    case(state)
      S0:
        LA <= GREEN;
        LB <= RED;
      S1:
        LA <= YELLOW;
      	LB <= RED;
      S2:
        LA <= RED;
      	LB <= GREEN;
      S3:
        LA <= RED;
      	LB <= YELLOW;
    endcase
  end
  
endmodule

module top();
  initial begin
    static int number = $urandom;
    static int count;
    
    static int i;
    static int number_copy = number;
    for (i = 0; i < 32; i = i + 1) begin
      static int bin_digit;
      bin_digit = number_copy[0];
      number_copy = number_copy >> 1;
      if(bin_digit == 1)
        count = count + 1;
    end
    
    $display("number in hex is %h", number);
    $display("number in binary is %b", number);
    $display("count is %d", count);
  end
endmodule

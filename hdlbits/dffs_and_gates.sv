module top_module (
    input clk,
    input x,
    output z
); 
    logic xor_res, and_res, or_res;
    
    always @(posedge clk) begin
        xor_res <= xor_res ^ x;
        and_res <= ~and_res & x;
        or_res <= ~or_res | x;
    end
    assign z = ~(xor_res | and_res | or_res);

    initial begin
        xor_res = 1'b0;
        and_res = 1'b0;
        or_res = 1'b0;
    end
endmodule

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire mux1_out, mux2_out;
    assign  mux1_out = E ? w : Q;
    assign  mux2_out = L ? R: mux1_out; 
    always @(posedge clk) begin       
        Q <= mux2_out;
    end
endmodule

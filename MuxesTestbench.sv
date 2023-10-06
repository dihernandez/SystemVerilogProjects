`timescale 1ns / 1ps

module muxes_testbench();
logic D0,D1,D2,D3,D4,D5,D6,D7;
wire Y;
logic[2:0] sel;

mux8 dut(D0, D1, D2, D3, D4, D5, D6, D7, sel, Y);

initial begin
    {D0, D1, D2, D3, D4, D5, D6, D7} <= 8'b1010_1010;
    sel <= 3'b111;
    if(Y !== 0) begin
        $display("Error: wrong selection, y is %b", Y);
    end
    #20;
    sel <= 3'b010;
    if(Y !== 1) begin
        $display("Error: wrong selection");
    end
    $display("Done");
end
endmodule

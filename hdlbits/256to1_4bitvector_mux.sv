module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    reg [9:0] upper_index;
    reg [9:0] lower_index;
    assign upper_index = ((sel+1'b1)<<2) - 1'b1;
    assign out = {in[upper_index], in[upper_index -1], in[upper_index -2], in[upper_index -3]};
endmodule

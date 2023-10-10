`timescale 1ns / 1ps

module mux8(
    input logic D0, D1, D2, D3, D4, D5, D6, D7, input logic[2:0] sel, output logic Y
    );
    wire int0, int1;
    
    mux4 m1(D0, D1, D2, D3, sel[1:0], int0);
    mux4 m2(D4, D5, D6, D7, sel[1:0], int1);
    
    always_comb begin
        if(sel[2])
            Y = int1;
        else
            Y = int0;
    end
endmodule

module mux4(input logic D0, D1, D2, D3, input logic[1:0] sel, output logic Y);
    always_comb begin
        case(sel)
            2'b00:
                Y = D0;
            2'b01:
                Y = D1;
            2'b10:
                Y = D2;
            2'b11:
                Y = D3;
        endcase
    end
endmodule

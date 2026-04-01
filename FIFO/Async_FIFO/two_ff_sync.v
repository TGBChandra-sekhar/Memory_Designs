// 2-FF Synchronizer for Pointers
module two_ff_sync #(
    parameter DATA_WIDTH = 4
    )( 
    input clk, rst_n,                   
    input [DATA_WIDTH-1:0] din,         // Input data
    output reg [DATA_WIDTH-1:0] dout    // Output of the second flip-flop
    );

    reg [DATA_WIDTH-1:0] ff_1;          // Output of the first flip-flop

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin 
            dout <= 0; 
            ff_1 <= 0; 
        end   
        else begin
            ff_1 <= din;          //FF_1(ff_1)
            dout <= ff_1;         //FF_2(dout)
         end
    end 
endmodule

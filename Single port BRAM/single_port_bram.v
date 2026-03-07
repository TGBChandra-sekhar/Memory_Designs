`timescale 1ns / 1ps

module single_port_bram (
        clk,
        wn,
        addr,
        din,
        dout
    );
        
    parameter ADDR_WIDTH = 8;
    parameter DATA_WIDTH = 8;
        
    input clk;
    input wn;
    input [ADDR_WIDTH-1:0] addr;
    input [DATA_WIDTH-1:0] din;
    output reg [DATA_WIDTH-1:0] dout;
    
    localparam DEPTH = 1 << ADDR_WIDTH;
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    
    always@(posedge clk) begin
        if(wn)                 // wn = 1; (write)
            mem[addr] <= din;  // Data Write into memory
        dout <= mem[addr];     // Data Read from memory
    end
endmodule

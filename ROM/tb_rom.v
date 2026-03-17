`timescale 1ns / 1ps

module tb_rom();

    parameter DATA_WIDTH = 20;
    parameter ADDR_WIDTH = 6;
    parameter DEPTH = 1 << ADDR_WIDTH;
    reg  clk;
    reg  en;
    reg  [ADDR_WIDTH-1:0] addr;
    wire [DATA_WIDTH-1:0] dout;
    
    integer i;
    
    rom uut (
        .clk    (clk ), 
        .en     (en  ), 
        .addr   (addr), 
        .dout   (dout)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        {clk,en,addr} = 0;
        #20;
        $display("\n **READ ONLY MEMORY**");
        en = 1;
        for(i = 0; i<DEPTH; i=i+1) begin
            addr = i;
            @(posedge clk);
            $display("\n Addr=%0d | Dout=%0d",addr,dout);
        end
        #100 $finish;
    end
endmodule

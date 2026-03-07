`timescale 1ns / 1ps

module single_port_bram_tb();

    parameter ADDR_WIDTH = 8;
    parameter DATA_WIDTH = 8;
    parameter DEPTH = 1 << ADDR_WIDTH;
    reg  clk;
    reg  wn;
    reg  [ADDR_WIDTH-1:0]addr;     
    reg  [DATA_WIDTH-1:0]din;      
    wire [DATA_WIDTH-1:0]dout;
    
    single_port_bram dut (
        .clk    (clk ),
        .wn     (wn  ),
        .addr   (addr),
        .din    (din ),
        .dout   (dout)
    );
    integer i;
    
    always #5 clk = ~clk;  // 100 MHz
    initial begin
        {clk,wn,addr,din} = 0;
        #10;
        $display("------ WRITE OPERATION ------");
        wn = 1;
        for(i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
            addr = i;
            din  = i * 10;
            $display("Writing: addr=%0d | Write_data=%0d | Read_data=%0d", addr, din,dout);
        end

        @(posedge clk);
        wn = 0;

        $display("------ READ OPERATION ------");

        for(i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
            addr = i;
            @(posedge clk); // For Display value at current addr (not prev addr)
            $display("Reading: addr=%0d | Read_data=%0d", addr, dout);
        end
        #50;
    end
endmodule

`timescale 1ns / 1ps

module tb_sync_fifo;

    parameter DATA_WIDTH = 16;
    parameter DEPTH = 16;

    reg  clk;
    reg  rst;
    reg  wr_en;
    reg  rd_en;
    reg  [DATA_WIDTH-1:0] wdata;
    wire [DATA_WIDTH-1:0] rdata;
    wire full;
    wire empty;
    
    integer i;

    sync_fifo dut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wdata(wdata),
        .rdata(rdata),
        .full(full),
        .empty(empty)
    );

    always #5 clk = ~clk; // 100 MHz
    
    initial begin
        {clk,wr_en,rd_en,wdata} = 0;
        rst =1;
        #20 rst = 0;
        
        // Write Operation
        $display("\n Writing data into FIFO ");
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge clk);
            if (!full) begin
                wr_en = 1;
                wdata = i + 100;
                $display("WRITE: Data = %h", wdata);
            end
        end
        
        //Checcking FULL Status
        @(posedge clk);
        wr_en = 0;
        if (full)
            $display("FIFO FULL asserted correctly");
        else
            $display("ERROR: FIFO FULL not asserted");
            
        // Read Operation
        $display("\n Reading data from FIFO ");
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge clk);
            if (!empty) begin
                rd_en = 1;
            end
            @(posedge clk);
            $display("READ: Data = %h", rdata);
        end
        rd_en = 0;
        
        //Checcking EMPTY Status
        if (empty)
            $display("FIFO EMPTY asserted correctly");
        else
            $display("ERROR: FIFO EMPTY not asserted");

        // SIMULTANEOUS READ & WRITE
        $display("\n--- Simultaneous Read & Write ---");
        @(posedge clk);
        wr_en = 1;
        rd_en = 1;
        wdata = 16'd1234;

        @(posedge clk);
        wr_en = 0;
        rd_en = 0;

        $display("SIMUL READ DATA = %h", rdata);
        
        #500 $finish;
    end

endmodule

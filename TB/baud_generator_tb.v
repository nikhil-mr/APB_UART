`timescale 1ns/1ps

module baud_generator_tb();

    reg pclk;
    reg presetn;
    reg [7:0] DLH;
    reg [7:0] DLL;
    reg osm_sel;
    wire bclk;

    baud_gen DUT (.pclk(pclk), .presetn(presetn), .DLH(DLH), .DLL(DLL), .osm_sel(osm_sel), .bclk(bclk));

    initial begin
        pclk = 1'b0;
        forever #20 pclk = ~ pclk;
    end

    task initialize;
        begin
            presetn = 1'b1;
            DLH = 8'd0;
            DLL = 8'd2;
            osm_sel = 1;

        end
    endtask

    task reset;
        begin
          @(negedge pclk);
          presetn = 1'b0;
          @(negedge pclk);
          presetn = 1'b1;
        end
    endtask

initial begin
    initialize;
    reset;
    #1000;
    $finish;
end

endmodule
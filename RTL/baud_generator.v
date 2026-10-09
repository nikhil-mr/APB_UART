module baud_generator(
    input pclk,
    input presetn,
    input [7:0] DLH,
    input [7:0] DLL,
    input osm_sel,
    output reg bclk


);
wire [31:0] divisor;
reg [31:0] count;


assign divisor = osm_sel ? {DLH,DLL} * 13 : {DLH,DLL} * 16;


//SCLK Signal Generation
	always@(posedge pclk or negedge presetn) begin
	if(!presetn) begin
		bclk <= 1'b1;
		count <= 12'd0;
	end
	else 
		if (count == ((divisor / 2) - 1'b1)) begin
			bclk <= ~ bclk;
			count <= 12'd0;
		end
		else begin
			bclk <= bclk;
			count <= count + 1'b1;
		end
	end


endmodule
module char_display
(
	input			clk,
	input			rst_n,
	
	output	[15:0]	out		

);

wire	[15:0]	data_out;
reg		[15:0]	count;
wire	[7:0]	raddr	=	count[15:8];

assign	out	=	{16{clk}} & data_out;


BRAM BRAM_inst
(
	.clk		(	clk			) ,	// input  clk
	.wr_en		(	1'b0			) ,	// input  wr_en
	.waddr		(	1'b0			) ,	// input [MEMWIDTH-1:0] waddr
	.raddr		(	raddr		) ,	// input [MEMWIDTH-1:0] raddr
	.data_in	(	8'b0			) ,	// input [DATAWIDTH-1:0] data_in
	.data_out	(	data_out	) 	// output [DATAWIDTH-1:0] data_out
);

defparam BRAM_inst.MEMWIDTH = 8;
defparam BRAM_inst.DATAWIDTH = 16;

always@(posedge clk,negedge rst_n)
begin
	if(!rst_n)
		count	<=	'b0;
	else
		count	<=	count	+	1'b1;
end

endmodule
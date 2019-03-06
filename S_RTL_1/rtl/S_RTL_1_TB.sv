/*
	Test bench for RTL_1



*/

module tb();

parameter CLK_CYCLE = 2;
parameter CLK_WIDTH = CLK_CYCLE/2;
parameter TRUE = 1;
parameter FALSE = 0;

logic [3:0]data;
logic clk;			//clock
logic data_out;		//data out
logic data_in;			//data in


sync_counter s(.fast_clk(clk), .data(data_in), .multiply(data_out));

initial
begin
	test = $fopen("test.log");
	$display("Begin");
	$display(test, "\tclk \tdata_in \tdata_out");
	$fmonitor(test, "%b \t %b \t %b", clk, data_in, data_out);
end

initial
begin
	fast_clk = TRUE;
	forever #CLK_WIDTH fast_clk = ~fast_clk;
end

initial 
begin
	data = 1010'b4;
	repeat (4) @(negedge clk) data_in = data;
	
end
















endmodule
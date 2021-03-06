/*
ECE481 Group 2
2/25/2019
Counter with 2 clocks, synthesized with one clock mux
Provided by Dr. Ataur Patwary
*/


module sync_counter(
	input logic clkA, clkB,
	input logic rst,
	input logic cntrl,
	input logic di,
	output logic dco);
	
logic clkAB, clkCDl;
logic dao;
logic dbo;

always_comb
begin
	clkAB = cntrl ? clkB : clkA;
	dbo = dao | di;
end

always_ff @ (posedge clkAB)
begin
	if(rst)
	dco <= 1'b0;
	
	else
	begin
		dao <= di;
	end
end

always_ff @ (posedge clkAB)
begin
	if(rst)
	dco <= 1'b0;
	else
	begin
		dco <= dbo;
	end
end
endmodule

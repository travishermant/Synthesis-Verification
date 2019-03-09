/*
ECE481 Group 2
2/25/2019
Counter with 2 clocks, synthesized with one clock mux
Provided by Dr. Ataur Patwary
*/


module sync_counter(input logic clkA, input logic [3:0] data, input logic rst, output logic [3:0] data_out );


always_ff @ (posedge clkA)
begin
	if(rst)
	begin
		data_out <= 4'b0;
	
	end
	else
	begin
		data_out <= data;
	end
end

endmodule

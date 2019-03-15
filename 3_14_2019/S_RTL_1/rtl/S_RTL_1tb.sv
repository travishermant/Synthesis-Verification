module sync_counter_tb;

parameter CLK_CYCLE = 2;
parameter CLK_WIDTH = CLK_CYCLE/2;

reg clk_in;
logic [3:0] data_in, data_out;

//module sync_counter(input logic fast_clk, input logic [3:0] data, output logic [3:0] multiply);
sync_counter usc( .fast_clk(clk_in), .data(data_in), .multiply(data_out));

initial 
	begin
	$monitor("Sent out %b got back %b", data_in, data_out);
	end

initial 
	begin
	clk_in = 1'b1;
		forever #CLK_WIDTH clk_in = ~clk_in;
	end

initial
	begin
		data_in = 0;
		repeat(16) begin
			@(negedge clk_in) begin	
				$display("Wrote out %b", data_in);
				data_in = data_in + 1;
			end		
		end
	end	
endmodule

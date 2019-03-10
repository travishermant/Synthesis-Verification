/*
ECE481 Group 2
2/25/2019
Provided by Dr. Ataur Patwary
*/


module sync_counter(input logic fast_clk, input logic [3:0] data, output logic [3:0] multiply);


logic [3:0] shift;
logic [3:0] synch;
logic [3:0] decode;
logic [3:0] comb1;
logic [3:0] comb2;
logic en, slow_clk;

div_cnt div_cnt(.fast_clk(fast_clk), .slow_clk(slow_clk), .en(en));

//tb stb( .clk_in(fast_clk), .clk_out(slow_clk));
/*
always @(*)
begin
	assign en = div_cnt[1] & div_cnt[0]; 
end*/

// Large delay cloud 1
always @(*)
begin
	comb1 [3] = synch [3] | synch[1];
	comb1 [2] = synch [2] & synch[1];
	comb1 [1] = synch [1];
	comb1 [0] = synch [1] & synch[0];
end

// Large delay cloud 2
always @(*)
begin
	comb2 [3] = decode [3] | decode[1];
	comb2 [2] = decode [2] & decode[1];
	comb2 [1] = decode [1];
	comb2 [0] = decode [1] & decode[0];
end

/*

			Flip flops

*/
// Shift register
always_ff @ (posedge fast_clk)
begin
	shift <= data;
end

// Synch Register
always_ff @ (posedge fast_clk)
begin
	if(en)
		synch <= shift;
end


// Slow domain registers 1
always_ff @ (posedge slow_clk)
begin
	decode <= comb1;
end

// Slow domain registers 2
always_ff @ (posedge slow_clk)
begin
	multiply <= comb2;
end
endmodule


module div_cnt(input logic fast_clk, output logic slow_clk, output logic en);
	logic [1:0] count = 2'b00;
	assign slow_clk = count[1];
	assign en = count[1] & count[0];
	
	always_ff @ (posedge fast_clk)
	begin
		count <= count + 1'b1;
	end

endmodule

/*



module tb;

	reg clk_in;
	wire clk_out;

	sync_counter usc( .fast_clk(clk_in), .slow_clk(clk_out));

	initial
	begin
		clk_in = 0;
		forever 
		begin			
			#10 clk_in = ~clk_in;
			#10 clk_out = clk_in; 
		end
	end
endmodule
*/

/*
ECE481 Group 2
2/25/2019
Provided by Dr. Ataur Patwary
*/


module sync_counter(input logic fast_clk, input logic [3:0] data, output logic [3:0] multiply_reg);


logic [3:0] shift_reg;
logic [3:0] synch_reg;
logic [3:0] decode_reg;
logic [3:0] comb1;
logic [3:0] comb2;
logic [1:0] div_cnt;
logic en;
logic slow_clk;

always @(*)
begin
	en = div_cnt[1] & div_cnt[0]; 
	slow_clk = div_cnt [0];
end

// Large delay cloud 1
always @(*)
begin
	comb1 [3] = synch_reg [3] | synch_reg[1];
	comb1 [2] = synch_reg [2] & synch_reg[1];
	comb1 [1] = synch_reg [1];
	comb1 [0] = synch_reg [1] & synch_reg[0];
end

// Large delay cloud 2
always @(*)
begin
	comb2 [3] = decode_reg [3] | decode_reg[1];
	comb2 [2] = decode_reg [2] & decode_reg[1];
	comb2 [1] = decode_reg [1];
	comb2 [0] = decode_reg [1] & decode_reg[0];
end

/*

			Flip flops

*/
// Shift register
always_ff @ (posedge fast_clk)
begin
	shift_reg <= data;
end

// Synch Register
always_ff @ (posedge fast_clk)
begin
	if(en)
		synch_reg <= shift_reg;
end

// Sync detector
// This needs to be fixed   		!!
always_ff @ (posedge fast_clk)
begin
	div_cnt [1] = 1'b1;
	div_cnt [0] = 1'b1;
end

// Slow domain registers 1
always_ff @ (posedge slow_clk)
begin
	decode_reg <= comb1;
end

// Slow domain registers 2
always_ff @ (posedge slow_clk)
begin
	multiply_reg <= comb2;
end

endmodule

/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Mar  2 18:17:38 2019
/////////////////////////////////////////////////////////////


module sync_counter ( fast_clk, data, multiply_reg );
  input [3:0] data;
  output [3:0] multiply_reg;
  input fast_clk;
  wire   \synch_reg[2] , synch_reg_0, \decode_reg[2] , decode_reg_0, n3, n4,
         n5, n6, n7, n8, n9, n10;
  wire   [3:0] comb1;
  wire   [3:0] comb2;

  DFFX1_RVT \shift_reg_reg[3]  ( .D(data[3]), .CLK(fast_clk), .Q(n9) );
  DFFX1_RVT \shift_reg_reg[2]  ( .D(data[2]), .CLK(fast_clk), .Q(n8) );
  DFFX1_RVT \shift_reg_reg[1]  ( .D(data[1]), .CLK(fast_clk), .Q(n7) );
  DFFX1_RVT \shift_reg_reg[0]  ( .D(data[0]), .CLK(fast_clk), .Q(n10) );
  DFFX1_RVT \synch_reg_reg[0]  ( .D(n10), .CLK(fast_clk), .Q(synch_reg_0) );
  DFFX1_RVT \synch_reg_reg[3]  ( .D(n9), .CLK(fast_clk), .QN(n3) );
  DFFX1_RVT \synch_reg_reg[2]  ( .D(n8), .CLK(fast_clk), .Q(\synch_reg[2] ) );
  DFFX1_RVT \synch_reg_reg[1]  ( .D(n7), .CLK(fast_clk), .Q(comb1[1]), .QN(n4)
         );
  DFFX1_RVT \decode_reg_reg[3]  ( .D(comb1[3]), .CLK(1'b1), .QN(n5) );
  DFFX1_RVT \decode_reg_reg[2]  ( .D(comb1[2]), .CLK(1'b1), .Q(\decode_reg[2] ) );
  DFFX1_RVT \decode_reg_reg[1]  ( .D(comb1[1]), .CLK(1'b1), .Q(comb2[1]), .QN(
        n6) );
  DFFX1_RVT \decode_reg_reg[0]  ( .D(comb1[0]), .CLK(1'b1), .Q(decode_reg_0)
         );
  DFFX1_RVT \multiply_reg_reg[3]  ( .D(comb2[3]), .CLK(1'b1), .Q(
        multiply_reg[3]) );
  DFFX1_RVT \multiply_reg_reg[2]  ( .D(comb2[2]), .CLK(1'b1), .Q(
        multiply_reg[2]) );
  DFFX1_RVT \multiply_reg_reg[1]  ( .D(comb2[1]), .CLK(1'b1), .Q(
        multiply_reg[1]) );
  DFFX1_RVT \multiply_reg_reg[0]  ( .D(comb2[0]), .CLK(1'b1), .Q(
        multiply_reg[0]) );
  NAND2X0_RVT U12 ( .A1(n6), .A2(n5), .Y(comb2[3]) );
  AND2X1_RVT U13 ( .A1(comb2[1]), .A2(\decode_reg[2] ), .Y(comb2[2]) );
  AND2X1_RVT U14 ( .A1(comb2[1]), .A2(decode_reg_0), .Y(comb2[0]) );
  NAND2X0_RVT U15 ( .A1(n4), .A2(n3), .Y(comb1[3]) );
  AND2X1_RVT U16 ( .A1(\synch_reg[2] ), .A2(comb1[1]), .Y(comb1[2]) );
  AND2X1_RVT U17 ( .A1(synch_reg_0), .A2(comb1[1]), .Y(comb1[0]) );
endmodule


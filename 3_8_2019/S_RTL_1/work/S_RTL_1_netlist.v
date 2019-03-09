/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Mar  6 19:47:54 2019
/////////////////////////////////////////////////////////////


module sync_counter ( fast_clk, data, multiply );
  input [3:0] data;
  output [3:0] multiply;
  input fast_clk;
  wire   slow_clk, en, \synch[2] , synch_0, \decode[2] , decode_0, n1, n5, n6,
         n8, n9, n10, n11, n14, n15, n16, n17, n18;
  wire   [3:0] comb1;
  wire   [3:0] comb2;

  div_cnt div_cnt ( .fast_clk(fast_clk), .slow_clk(slow_clk), .en(en) );
  DFFX1_RVT \shift_reg[3]  ( .D(data[3]), .CLK(fast_clk), .Q(n10) );
  DFFX1_RVT \shift_reg[2]  ( .D(data[2]), .CLK(fast_clk), .Q(n8) );
  DFFX1_RVT \shift_reg[1]  ( .D(data[1]), .CLK(fast_clk), .Q(n6) );
  DFFX1_RVT \shift_reg[0]  ( .D(data[0]), .CLK(fast_clk), .Q(n5) );
  DFFX1_RVT \synch_reg[3]  ( .D(n18), .CLK(fast_clk), .Q(n9), .QN(n11) );
  DFFX1_RVT \synch_reg[2]  ( .D(n17), .CLK(fast_clk), .Q(\synch[2] ) );
  DFFX1_RVT \synch_reg[1]  ( .D(n16), .CLK(fast_clk), .Q(comb1[1]) );
  DFFX1_RVT \synch_reg[0]  ( .D(n15), .CLK(fast_clk), .Q(synch_0) );
  DFFSSRX1_RVT \decode_reg[3]  ( .D(comb1[1]), .SETB(n11), .RSTB(1'b1), .CLK(
        slow_clk), .QN(n14) );
  DFFX1_RVT \decode_reg[2]  ( .D(comb1[2]), .CLK(slow_clk), .Q(\decode[2] ) );
  DFFX1_RVT \decode_reg[1]  ( .D(comb1[1]), .CLK(slow_clk), .Q(comb2[1]) );
  DFFX1_RVT \decode_reg[0]  ( .D(comb1[0]), .CLK(slow_clk), .Q(decode_0) );
  DFFSSRX1_RVT \multiply_reg[3]  ( .D(comb2[1]), .SETB(n14), .RSTB(1'b1), 
        .CLK(slow_clk), .Q(multiply[3]) );
  DFFX1_RVT \multiply_reg[2]  ( .D(comb2[2]), .CLK(slow_clk), .Q(multiply[2])
         );
  DFFX1_RVT \multiply_reg[1]  ( .D(comb2[1]), .CLK(slow_clk), .Q(multiply[1])
         );
  DFFX1_RVT \multiply_reg[0]  ( .D(comb2[0]), .CLK(slow_clk), .Q(multiply[0])
         );
  AO22X1_RVT U3 ( .A1(n5), .A2(en), .A3(synch_0), .A4(n1), .Y(n15) );
  AO22X1_RVT U4 ( .A1(n6), .A2(en), .A3(n1), .A4(comb1[1]), .Y(n16) );
  AO22X1_RVT U5 ( .A1(n8), .A2(en), .A3(\synch[2] ), .A4(n1), .Y(n17) );
  AO22X1_RVT U6 ( .A1(n10), .A2(en), .A3(n9), .A4(n1), .Y(n18) );
  INVX0_RVT U7 ( .A(en), .Y(n1) );
  AND2X1_RVT U8 ( .A1(\decode[2] ), .A2(comb2[1]), .Y(comb2[2]) );
  AND2X1_RVT U9 ( .A1(comb2[1]), .A2(decode_0), .Y(comb2[0]) );
  AND2X1_RVT U11 ( .A1(\synch[2] ), .A2(comb1[1]), .Y(comb1[2]) );
  AND2X1_RVT U12 ( .A1(synch_0), .A2(comb1[1]), .Y(comb1[0]) );
endmodule


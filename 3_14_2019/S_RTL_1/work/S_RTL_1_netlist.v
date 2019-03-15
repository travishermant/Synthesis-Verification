/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Mar 14 17:04:20 2019
/////////////////////////////////////////////////////////////


module sync_counter ( fast_clk, data, multiply );
  input [3:0] data;
  output [3:0] multiply;
  input fast_clk;
  wire   \count[1] , \decode[2] , N1, n1, n2, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [3:0] synch;
  wire   [3:0] comb1;
  wire   [3:0] comb2;

  DFFX1_RVT \shift_reg[3]  ( .D(data[3]), .CLK(fast_clk), .Q(n9) );
  DFFX1_RVT \shift_reg[2]  ( .D(data[2]), .CLK(fast_clk), .Q(n8) );
  DFFX1_RVT \shift_reg[1]  ( .D(data[1]), .CLK(fast_clk), .Q(n7) );
  DFFX1_RVT \shift_reg[0]  ( .D(data[0]), .CLK(fast_clk), .Q(n10) );
  DFFX1_RVT \count_reg[0]  ( .D(n20), .CLK(fast_clk), .Q(n19), .QN(n16) );
  DFFX1_RVT \count_reg[1]  ( .D(N1), .CLK(fast_clk), .Q(\count[1] ) );
  DFFX1_RVT \decode_reg[3]  ( .D(comb1[3]), .CLK(n15), .QN(n5) );
  DFFX1_RVT \decode_reg[2]  ( .D(comb1[2]), .CLK(n15), .Q(\decode[2] ) );
  DFFX1_RVT \decode_reg[1]  ( .D(comb1[1]), .CLK(n15), .Q(n17), .QN(n6) );
  DFFX1_RVT \decode_reg[0]  ( .D(comb1[0]), .CLK(n15), .Q(n18), .QN(n4) );
  DFFX1_RVT \multiply_reg[3]  ( .D(comb2[3]), .CLK(n15), .Q(multiply[3]) );
  DFFX1_RVT \multiply_reg[2]  ( .D(comb2[2]), .CLK(n15), .Q(multiply[2]) );
  DFFX1_RVT \multiply_reg[1]  ( .D(comb2[1]), .CLK(n15), .Q(multiply[1]) );
  DFFX1_RVT \multiply_reg[0]  ( .D(comb2[0]), .CLK(n15), .Q(multiply[0]) );
  DFFX1_RVT \synch_reg[0]  ( .D(n14), .CLK(fast_clk), .Q(synch[0]) );
  DFFX1_RVT \synch_reg[3]  ( .D(n13), .CLK(fast_clk), .Q(synch[3]) );
  DFFX1_RVT \synch_reg[2]  ( .D(n12), .CLK(fast_clk), .Q(synch[2]) );
  DFFX1_RVT \synch_reg[1]  ( .D(n11), .CLK(fast_clk), .Q(synch[1]) );
  AO22X1_RVT U3 ( .A1(synch[3]), .A2(n1), .A3(n9), .A4(n21), .Y(n13) );
  AO22X1_RVT U4 ( .A1(synch[2]), .A2(n1), .A3(n8), .A4(n21), .Y(n12) );
  AO22X1_RVT U5 ( .A1(synch[1]), .A2(n1), .A3(n7), .A4(n2), .Y(n11) );
  AO22X1_RVT U6 ( .A1(synch[0]), .A2(n1), .A3(n10), .A4(n21), .Y(n14) );
  INVX0_RVT U7 ( .A(n1), .Y(n2) );
  OR2X1_RVT U8 ( .A1(n22), .A2(n16), .Y(n1) );
  OR2X1_RVT U15 ( .A1(synch[3]), .A2(synch[1]), .Y(comb1[3]) );
  AND2X1_RVT U16 ( .A1(synch[1]), .A2(synch[2]), .Y(comb1[2]) );
  OR2X1_RVT U17 ( .A1(synch[1]), .A2(synch[0]), .Y(comb1[1]) );
  AND2X1_RVT U18 ( .A1(synch[0]), .A2(synch[1]), .Y(comb1[0]) );
  XNOR2X1_RVT U19 ( .A1(\count[1] ), .A2(n20), .Y(N1) );
  INVX1_RVT U20 ( .A(n19), .Y(n20) );
  NBUFFX2_RVT U21 ( .A(n2), .Y(n21) );
  INVX1_RVT U22 ( .A(\count[1] ), .Y(n22) );
  INVX1_RVT U23 ( .A(\count[1] ), .Y(n15) );
  AND2X1_RVT U24 ( .A1(n17), .A2(n18), .Y(comb2[0]) );
  NAND2X0_RVT U25 ( .A1(n4), .A2(n6), .Y(comb2[1]) );
  AND2X1_RVT U26 ( .A1(\decode[2] ), .A2(n17), .Y(comb2[2]) );
  NAND2X0_RVT U27 ( .A1(n5), .A2(n6), .Y(comb2[3]) );
endmodule


/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Mar  5 19:34:22 2019
/////////////////////////////////////////////////////////////


module sync_counter ( fast_clk, data, multiply );
  input [3:0] data;
  output [3:0] multiply;
  input fast_clk;
  wire   slow_clk, en, \decode[2] , decode_0, \comb2[1] , n1, n2, n4, n5, n6,
         n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23;

  div_cnt div_cnt ( .fast_clk(fast_clk), .slow_clk(slow_clk), .en(en) );
  DFFX1_RVT \shift_reg[3]  ( .D(data[3]), .CLK(fast_clk), .Q(n13) );
  DFFX1_RVT \shift_reg[2]  ( .D(data[2]), .CLK(fast_clk), .Q(n11) );
  DFFX1_RVT \shift_reg[1]  ( .D(data[1]), .CLK(fast_clk), .Q(n8) );
  DFFX1_RVT \shift_reg[0]  ( .D(data[0]), .CLK(fast_clk), .Q(n7) );
  DFFX1_RVT \synch_reg[3]  ( .D(n23), .CLK(fast_clk), .Q(n12) );
  DFFX1_RVT \synch_reg[2]  ( .D(n22), .CLK(fast_clk), .Q(n10) );
  DFFX1_RVT \synch_reg[1]  ( .D(n21), .CLK(fast_clk), .Q(n2) );
  DFFX1_RVT \synch_reg[0]  ( .D(n20), .CLK(fast_clk), .Q(n6) );
  DFFX1_RVT \decode_reg[3]  ( .D(n19), .CLK(slow_clk), .QN(n4) );
  DFFX1_RVT \decode_reg[2]  ( .D(n18), .CLK(slow_clk), .Q(\decode[2] ) );
  DFFX1_RVT \decode_reg[1]  ( .D(n2), .CLK(slow_clk), .Q(\comb2[1] ), .QN(n5)
         );
  DFFX1_RVT \decode_reg[0]  ( .D(n17), .CLK(slow_clk), .Q(decode_0) );
  DFFX1_RVT \multiply_reg[3]  ( .D(n16), .CLK(slow_clk), .Q(multiply[3]) );
  DFFX1_RVT \multiply_reg[2]  ( .D(n15), .CLK(slow_clk), .Q(multiply[2]) );
  DFFX1_RVT \multiply_reg[1]  ( .D(\comb2[1] ), .CLK(slow_clk), .Q(multiply[1]) );
  DFFX1_RVT \multiply_reg[0]  ( .D(n14), .CLK(slow_clk), .Q(multiply[0]) );
  AO22X1_RVT U3 ( .A1(n7), .A2(en), .A3(n6), .A4(n1), .Y(n20) );
  AO22X1_RVT U4 ( .A1(n8), .A2(en), .A3(n1), .A4(n2), .Y(n21) );
  AO22X1_RVT U5 ( .A1(n11), .A2(en), .A3(n10), .A4(n1), .Y(n22) );
  AO22X1_RVT U6 ( .A1(n13), .A2(en), .A3(n12), .A4(n1), .Y(n23) );
  INVX0_RVT U7 ( .A(en), .Y(n1) );
  NAND2X0_RVT U8 ( .A1(n4), .A2(n5), .Y(n16) );
  AND2X1_RVT U9 ( .A1(\comb2[1] ), .A2(\decode[2] ), .Y(n15) );
  AND2X1_RVT U10 ( .A1(\comb2[1] ), .A2(decode_0), .Y(n14) );
  OR2X1_RVT U12 ( .A1(n2), .A2(n12), .Y(n19) );
  AND2X1_RVT U13 ( .A1(n10), .A2(n2), .Y(n18) );
  AND2X1_RVT U14 ( .A1(n6), .A2(n2), .Y(n17) );
endmodule


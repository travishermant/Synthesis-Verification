/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Mar  9 17:51:00 2019
/////////////////////////////////////////////////////////////


module sync_counter ( fast_clk, data, multiply );
  input [3:0] data;
  output [3:0] multiply;
  input fast_clk;
  wire   \count[1] , \synch[2] , synch_0, \comb1[0] , \decode[2] , decode_0,
         \comb2[0] , N1, n1, n2, n3, n4, n5, n7, n9, n10, n11, n12, n13, n16,
         n17, n18, n19, n20, n21, n24, n25, n26, n27, n28, n29;

  DFFX1_RVT \shift_reg[3]  ( .D(data[3]), .CLK(fast_clk), .Q(n10) );
  DFFX1_RVT \shift_reg[2]  ( .D(data[2]), .CLK(fast_clk), .Q(n9) );
  DFFX1_RVT \shift_reg[1]  ( .D(data[1]), .CLK(fast_clk), .Q(n7) );
  DFFX1_RVT \shift_reg[0]  ( .D(data[0]), .CLK(fast_clk), .Q(n12) );
  DFFX1_RVT \count_reg[1]  ( .D(N1), .CLK(fast_clk), .Q(\count[1] ) );
  DFFX1_RVT \synch_reg[0]  ( .D(n20), .CLK(fast_clk), .Q(synch_0) );
  DFFX1_RVT \synch_reg[3]  ( .D(n19), .CLK(fast_clk), .Q(n11), .QN(n13) );
  DFFX1_RVT \synch_reg[2]  ( .D(n18), .CLK(fast_clk), .Q(\synch[2] ) );
  DFFX1_RVT \synch_reg[1]  ( .D(n17), .CLK(fast_clk), .Q(n2) );
  DFFX1_RVT \decode_reg[1]  ( .D(n2), .CLK(n24), .Q(n5) );
  DFFX1_RVT \multiply_reg[1]  ( .D(n5), .CLK(n24), .Q(multiply[1]) );
  DFFX1_RVT \decode_reg[0]  ( .D(\comb1[0] ), .CLK(n24), .Q(decode_0) );
  DFFX1_RVT \multiply_reg[0]  ( .D(\comb2[0] ), .CLK(n24), .Q(multiply[0]) );
  DFFSSRX1_RVT \decode_reg[3]  ( .D(n2), .SETB(n13), .RSTB(1'b1), .CLK(
        \count[1] ), .QN(n16) );
  DFFSSRX1_RVT \multiply_reg[3]  ( .D(n5), .SETB(n16), .RSTB(1'b1), .CLK(
        \count[1] ), .Q(multiply[3]) );
  AO22X1_RVT U3 ( .A1(n25), .A2(n2), .A3(n7), .A4(n26), .Y(n17) );
  AO22X1_RVT U4 ( .A1(\synch[2] ), .A2(n27), .A3(n9), .A4(n28), .Y(n18) );
  AO22X1_RVT U5 ( .A1(n11), .A2(n27), .A3(n10), .A4(n28), .Y(n19) );
  AO22X1_RVT U6 ( .A1(synch_0), .A2(n25), .A3(n12), .A4(n26), .Y(n20) );
  NAND2X0_RVT U8 ( .A1(\count[1] ), .A2(n4), .Y(n1) );
  AND2X1_RVT U10 ( .A1(n5), .A2(decode_0), .Y(\comb2[0] ) );
  AND2X1_RVT U13 ( .A1(synch_0), .A2(n2), .Y(\comb1[0] ) );
  XOR2X1_RVT U15 ( .A1(\count[1] ), .A2(n4), .Y(N1) );
  DFFX1_RVT \count_reg[0]  ( .D(n21), .CLK(fast_clk), .Q(n4), .QN(n21) );
  DFFSSRX1_RVT \decode_reg[2]  ( .D(\synch[2] ), .SETB(1'b1), .RSTB(n2), .CLK(
        \count[1] ), .Q(\decode[2] ) );
  DFFSSRX1_RVT \multiply_reg[2]  ( .D(\decode[2] ), .SETB(1'b1), .RSTB(n5), 
        .CLK(n24), .Q(multiply[2]) );
  INVX1_RVT U21 ( .A(n1), .Y(n3) );
  NBUFFX2_RVT U22 ( .A(\count[1] ), .Y(n24) );
  NBUFFX2_RVT U23 ( .A(n29), .Y(n25) );
  NBUFFX2_RVT U24 ( .A(n3), .Y(n26) );
  NBUFFX2_RVT U25 ( .A(n29), .Y(n27) );
  NBUFFX2_RVT U26 ( .A(n3), .Y(n28) );
  NBUFFX2_RVT U27 ( .A(n1), .Y(n29) );
endmodule


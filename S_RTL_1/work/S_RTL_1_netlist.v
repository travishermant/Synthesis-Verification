/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Mar  3 22:38:36 2019
/////////////////////////////////////////////////////////////


module sync_counter ( fast_clk, data, multiply );
  input [3:0] data;
  output [3:0] multiply;
  input fast_clk;
  wire   slow_clk, en, \comb1[1] , \decode[2] , decode_0, \comb2[1] , n4, n5,
         n7, n8, n9, n11, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27;

  div_cnt div_cnt ( .fast_clk(fast_clk), .slow_clk(slow_clk), .en(en) );
  DFFX1_RVT \shift_reg[3]  ( .D(data[3]), .CLK(fast_clk), .Q(n13) );
  DFFX1_RVT \shift_reg[2]  ( .D(data[2]), .CLK(fast_clk), .Q(n11) );
  DFFX1_RVT \shift_reg[1]  ( .D(data[1]), .CLK(fast_clk), .Q(n8) );
  DFFX1_RVT \shift_reg[0]  ( .D(data[0]), .CLK(fast_clk), .Q(n7) );
  DFFX1_RVT \synch_reg[3]  ( .D(n23), .CLK(fast_clk), .Q(n26), .QN(n27) );
  DFFX1_RVT \synch_reg[2]  ( .D(n22), .CLK(fast_clk), .Q(n24) );
  DFFX1_RVT \synch_reg[1]  ( .D(n21), .CLK(fast_clk), .Q(\comb1[1] ), .QN(n9)
         );
  DFFX1_RVT \synch_reg[0]  ( .D(n20), .CLK(fast_clk), .Q(n25) );
  DFFX1_RVT \decode_reg[3]  ( .D(n19), .CLK(slow_clk), .QN(n4) );
  DFFX1_RVT \decode_reg[2]  ( .D(n18), .CLK(slow_clk), .Q(\decode[2] ) );
  DFFX1_RVT \decode_reg[1]  ( .D(\comb1[1] ), .CLK(slow_clk), .Q(\comb2[1] ), 
        .QN(n5) );
  DFFX1_RVT \decode_reg[0]  ( .D(n17), .CLK(slow_clk), .Q(decode_0) );
  DFFX1_RVT \multiply_reg[3]  ( .D(n16), .CLK(slow_clk), .Q(multiply[3]) );
  DFFX1_RVT \multiply_reg[2]  ( .D(n15), .CLK(slow_clk), .Q(multiply[2]) );
  DFFX1_RVT \multiply_reg[1]  ( .D(\comb2[1] ), .CLK(slow_clk), .Q(multiply[1]) );
  DFFX1_RVT \multiply_reg[0]  ( .D(n14), .CLK(slow_clk), .Q(multiply[0]) );
  MUX21X1_RVT U16 ( .A1(n26), .A2(n13), .S0(en), .Y(n23) );
  MUX21X1_RVT U17 ( .A1(n24), .A2(n11), .S0(en), .Y(n22) );
  MUX21X1_RVT U18 ( .A1(\comb1[1] ), .A2(n8), .S0(en), .Y(n21) );
  MUX21X1_RVT U19 ( .A1(n25), .A2(n7), .S0(en), .Y(n20) );
  NAND2X0_RVT U20 ( .A1(n27), .A2(n9), .Y(n19) );
  AND2X1_RVT U21 ( .A1(\comb1[1] ), .A2(n24), .Y(n18) );
  AND2X1_RVT U22 ( .A1(\comb1[1] ), .A2(n25), .Y(n17) );
  NAND2X0_RVT U23 ( .A1(n5), .A2(n4), .Y(n16) );
  AND2X1_RVT U24 ( .A1(\comb2[1] ), .A2(\decode[2] ), .Y(n15) );
  AND2X1_RVT U25 ( .A1(\comb2[1] ), .A2(decode_0), .Y(n14) );
endmodule


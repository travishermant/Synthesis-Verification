/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Mar 13 14:26:49 2019
/////////////////////////////////////////////////////////////


module sync_counter ( clkA, clkB, clkC, clkD, rst, cntrlAB, cntrlCD, di, dco
 );
  input [1:0] di;
  input clkA, clkB, clkC, clkD, rst, cntrlAB, cntrlCD;
  output dco;
  wire   N0, N2, clkAB, clkCD, N9, N10, N12, n2, n3;
  wire   [1:0] dao;
  assign N0 = cntrlAB;
  assign N2 = cntrlCD;

  DFFX1_RVT \dao_reg[1]  ( .D(N10), .CLK(clkAB), .Q(dao[1]) );
  DFFX1_RVT \dao_reg[0]  ( .D(N9), .CLK(clkAB), .Q(dao[0]) );
  DFFX1_RVT dco_reg ( .D(N12), .CLK(clkCD), .Q(dco) );
  AND2X1_RVT U5 ( .A1(di[0]), .A2(n3), .Y(N9) );
  AND2X1_RVT U8 ( .A1(n2), .A2(n3), .Y(N12) );
  AND2X1_RVT U9 ( .A1(di[1]), .A2(n3), .Y(N10) );
  XOR2X1_RVT U10 ( .A1(dao[1]), .A2(dao[0]), .Y(n2) );
  INVX1_RVT U11 ( .A(rst), .Y(n3) );
  MUX21X1_RVT U12 ( .A1(clkC), .A2(clkD), .S0(N2), .Y(clkCD) );
  MUX21X1_RVT U13 ( .A1(clkA), .A2(clkB), .S0(N0), .Y(clkAB) );
endmodule


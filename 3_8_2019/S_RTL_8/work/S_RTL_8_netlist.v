/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Mar  5 17:54:50 2019
/////////////////////////////////////////////////////////////


module sync_counter ( clkA, clkB, clkC, clkD, rst, cntrlAB, cntrlCD, di, dco
 );
  input [1:0] di;
  input clkA, clkB, clkC, clkD, rst, cntrlAB, cntrlCD;
  output dco;
  wire   N0, N2, clkAB, clkCD, N9, N10, n2, n4;
  wire   [1:0] dao;
  assign N0 = cntrlAB;
  assign N2 = cntrlCD;

  DFFX1_RVT \dao_reg[1]  ( .D(N10), .CLK(clkAB), .Q(dao[1]) );
  DFFX1_RVT \dao_reg[0]  ( .D(N9), .CLK(clkAB), .Q(dao[0]) );
  AND2X1_RVT U5 ( .A1(di[0]), .A2(n4), .Y(N9) );
  AND2X1_RVT U9 ( .A1(di[1]), .A2(n4), .Y(N10) );
  DFFSSRX1_RVT dco_reg ( .D(n2), .SETB(1'b1), .RSTB(n4), .CLK(clkCD), .Q(dco)
         );
  XOR2X1_RVT U11 ( .A1(dao[1]), .A2(dao[0]), .Y(n2) );
  INVX1_RVT U12 ( .A(rst), .Y(n4) );
  MUX21X1_RVT U13 ( .A1(clkC), .A2(clkD), .S0(N2), .Y(clkCD) );
  MUX21X1_RVT U14 ( .A1(clkA), .A2(clkB), .S0(N0), .Y(clkAB) );
endmodule


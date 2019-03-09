/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Feb 27 17:41:11 2019
/////////////////////////////////////////////////////////////


module sync_counter ( clkA, clkB, clkC, clkD, rst, cntrlAB, cntrlCD, di, dco
 );
  input clkA, clkB, clkC, clkD, rst, cntrlAB, cntrlCD, di;
  output dco;
  wire   N0, N2, clkAB, clkCD, \dao[0] , N9, N11, n3;
  assign N0 = cntrlAB;
  assign N2 = cntrlCD;

  DFFX1_RVT \dao_reg[0]  ( .D(N9), .CLK(clkAB), .Q(\dao[0] ) );
  DFFX1_RVT dco_reg ( .D(N11), .CLK(clkCD), .Q(dco) );
  AND2X1_RVT U10 ( .A1(di), .A2(n3), .Y(N9) );
  AND2X1_RVT U11 ( .A1(\dao[0] ), .A2(n3), .Y(N11) );
  INVX0_RVT U12 ( .A(rst), .Y(n3) );
  MUX21X1_RVT U13 ( .A1(clkC), .A2(clkD), .S0(N2), .Y(clkCD) );
  MUX21X1_RVT U14 ( .A1(clkA), .A2(clkB), .S0(N0), .Y(clkAB) );
endmodule


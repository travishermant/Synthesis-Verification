/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Mar 12 18:10:46 2019
/////////////////////////////////////////////////////////////


module sync_counter ( clkA, clkB, rst, cntrl, di, dco );
  input clkA, clkB, rst, cntrl, di;
  output dco;
  wire   N0, clkAB, dao, N6, N7, n2;
  assign N0 = cntrl;

  DFFX1_RVT dao_reg ( .D(N6), .CLK(clkAB), .Q(dao) );
  DFFX1_RVT dco_reg ( .D(N7), .CLK(clkAB), .Q(dco) );
  AO21X1_RVT U4 ( .A1(dao), .A2(n2), .A3(N6), .Y(N7) );
  AND2X1_RVT U5 ( .A1(di), .A2(n2), .Y(N6) );
  INVX1_RVT U6 ( .A(rst), .Y(n2) );
  MUX21X1_RVT U7 ( .A1(clkA), .A2(clkB), .S0(N0), .Y(clkAB) );
endmodule


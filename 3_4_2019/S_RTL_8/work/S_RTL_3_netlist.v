/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Feb 26 17:52:38 2019
/////////////////////////////////////////////////////////////


module sync_counter ( clkA, clkB, rst, cntrl, di, dco );
  input clkA, clkB, rst, cntrl, di;
  output dco;
  wire   N0, clkAB, dao, N6, n3, n4;
  assign N0 = cntrl;

  DFFX1_RVT dao_reg ( .D(N6), .CLK(clkAB), .Q(dao) );
  DFFSSRX1_RVT dco_reg ( .D(dao), .SETB(n4), .RSTB(n3), .CLK(clkAB), .Q(dco)
         );
  INVX0_RVT U6 ( .A(di), .Y(n4) );
  AND2X1_RVT U7 ( .A1(di), .A2(n3), .Y(N6) );
  INVX0_RVT U8 ( .A(rst), .Y(n3) );
  MUX21X1_RVT U9 ( .A1(clkA), .A2(clkB), .S0(N0), .Y(clkAB) );
endmodule


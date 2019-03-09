/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Mar  2 16:29:43 2019
/////////////////////////////////////////////////////////////


module sync_counter ( clkA, data, rst, data_out );
  input [3:0] data;
  output [3:0] data_out;
  input clkA, rst;
  wire   N3, N4, N5, N6, n2;

  DFFX1_RVT \data_out_reg[3]  ( .D(N6), .CLK(clkA), .Q(data_out[3]) );
  DFFX1_RVT \data_out_reg[2]  ( .D(N5), .CLK(clkA), .Q(data_out[2]) );
  DFFX1_RVT \data_out_reg[1]  ( .D(N4), .CLK(clkA), .Q(data_out[1]) );
  DFFX1_RVT \data_out_reg[0]  ( .D(N3), .CLK(clkA), .Q(data_out[0]) );
  AND2X1_RVT U8 ( .A1(data[3]), .A2(n2), .Y(N6) );
  AND2X1_RVT U9 ( .A1(data[2]), .A2(n2), .Y(N5) );
  AND2X1_RVT U10 ( .A1(data[1]), .A2(n2), .Y(N4) );
  AND2X1_RVT U11 ( .A1(data[0]), .A2(n2), .Y(N3) );
  INVX0_RVT U12 ( .A(rst), .Y(n2) );
endmodule


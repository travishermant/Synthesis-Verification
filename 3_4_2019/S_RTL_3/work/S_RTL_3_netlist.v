/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : L-2016.03-SP3
// Date      : Tue Feb 26 14:28:14 2019
/////////////////////////////////////////////////////////////


module sync_counter ( clkA, clkB, rst, cntrl, di, dco );
  input clkA, clkB, rst, cntrl, di;
  output dco;
  wire   N0, N1, N2, N3, N4, clkAB, dbo, N5, N6;

  \**SEQGEN**  dco_reg ( .clear(1'b0), .preset(1'b0), .next_state(N6), 
        .clocked_on(clkAB), .data_in(1'b0), .enable(1'b0), .Q(dco), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  SELECT_OP C18 ( .DATA1(clkB), .DATA2(clkA), .CONTROL1(N0), .CONTROL2(N1), 
        .Z(clkAB) );
  GTECH_BUF B_0 ( .A(cntrl), .Z(N0) );
  GTECH_BUF B_1 ( .A(N4), .Z(N1) );
  SELECT_OP C19 ( .DATA1(1'b0), .DATA2(dbo), .CONTROL1(N2), .CONTROL2(N3), .Z(
        N6) );
  GTECH_BUF B_2 ( .A(rst), .Z(N2) );
  GTECH_BUF B_3 ( .A(N5), .Z(N3) );
  GTECH_NOT I_0 ( .A(cntrl), .Z(N4) );
  GTECH_OR2 C25 ( .A(1'b0), .B(di), .Z(dbo) );
  GTECH_NOT I_1 ( .A(rst), .Z(N5) );
endmodule


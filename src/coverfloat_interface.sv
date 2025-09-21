interface coverfloat_interface; import coverfloat_pkg::*;

    logic         clk;

    logic         valid;

    logic [31:0]  op;

    logic [31:0]  rm;

    logic [31:0]  enableBits;
    
    logic [127:0] a,    b,    c;
    logic [2:0]   aFmt, bFmt, cFmt; // 000 = half; 001 = float; 010 = double; 011 = quad; 100 = int; 101 = long

    logic [127:0] result;
    logic [2:0]   resultFmt;

    logic [31:0]  exceptionBits;

endinterface
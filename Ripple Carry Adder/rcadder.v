// 4-bit Ripple carry adder module

`include "fulladder.v"    // using full adder in RC module
module rcadder (a, b, carry_in, sum, carry_out);
input [3:0]a,b;
input carry_in;
output [3:0]sum;
output carry_out;
wire [2:0]w;
fulladder fa0(a[0],b[0],carry_in ,sum[0],w[0]); 
fulladder fa1(a[1],b[1],w[0],sum[1],w[1]);
fulladder fa2(a[2],b[2],w[1],sum[2],w[2]);
fulladder fa3(a[3],b[3],w[2],sum[3],carry_out);
endmodule
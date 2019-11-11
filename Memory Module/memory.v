`timescale 1ns/1ns

module memory(input [2:0] I, input [1:0] A, input cs, rd, oe, output [2:0] O);
wire [3:0] q1, q2, q3; // Outputs of the flip-flops 
wire [3:0] clk;
wire [3:0] w_en;
wire r_en;

// Address and control lines to enable read and write
assign w_en[0] = ((~A[1] & ~A[0]) & (cs & ~rd));
assign w_en[1] = ((~A[1] & A[0]) & (cs & ~rd));
assign w_en[2] = ((A[1] & ~A[0]) & (cs & ~rd));
assign w_en[3] = ((A[1] & A[0]) & (cs & ~rd));
assign r_en = (cs & rd & oe);

// Instantiate the flip-flops
// Row 1 
d_ff d1(w_en[0], I[0], q1[0]);
d_ff d2(w_en[0], I[1], q2[0]);
d_ff d3(w_en[0], I[2], q3[0]);

// Row 2 
d_ff d4(w_en[1], I[0], q1[1]);
d_ff d5(w_en[1], I[1], q2[1]);
d_ff d6(w_en[1], I[2], q3[1]);

// Row 3
d_ff d7(w_en[2], I[0], q1[2]);
d_ff d8(w_en[2], I[1], q2[2]);
d_ff d9(w_en[2], I[2], q3[2]);

// Row 4 
d_ff d10(w_en[3], I[0], q1[3]);
d_ff d11(w_en[3], I[1], q2[3]);
d_ff d12(w_en[3], I[2], q3[3]);

// Ouputs 
assign O[0] = (r_en) ? ((q1[0] & (~A[1] & ~A[0])) | (q1[1] & (~A[1] & A[0])) | (q1[2] & (A[1] & ~A[0])) | (q1[3] & (A[1] & A[0]))) : 1'bz;
assign O[1] = (r_en) ? ((q2[0] & (~A[1] & ~A[0])) | (q2[1] & (~A[1] & A[0])) | (q2[2] & (A[1] & ~A[0])) | (q2[3] & (A[1] & A[0]))) : 1'bz;
assign O[2] = (r_en) ? ((q3[0] & (~A[1] & ~A[0])) | (q3[1] & (~A[1] & A[0])) | (q3[2] & (A[1] & ~A[0])) | (q3[3] & (A[1] & A[0]))) : 1'bz;

endmodule
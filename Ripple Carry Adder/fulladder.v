// full adder module 

module fulladder (a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
assign {cout,sum} = a + b + cin;
endmodule
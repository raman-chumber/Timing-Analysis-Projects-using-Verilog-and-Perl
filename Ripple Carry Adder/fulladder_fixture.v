// full adder testbench - for testing if the full adder is working properly

module fulladder_fixture;
reg a;
reg b;
reg cin;

wire sum;
wire cout;

fulladder uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

initial
begin
a =0;
b =0;
cin =0;
#20; a =1;
#20; b =1;
#20; a =0;
#20; cin =1;
#20; b=0;
#20; a=1;
#20; b=1;
#40;
end

initial
begin
$monitor("time = %2d, CIN =%1b, A=%1b, B=%1b, COUT=%1b, SUM=%1b", $time, cin, a, b, cout, sum);
end

endmodule

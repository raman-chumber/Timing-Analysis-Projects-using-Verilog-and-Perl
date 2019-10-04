{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c100000;}
\margl1440\margr1440\vieww15320\viewh13920\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs28 \cf2 \cb3 \CocoaLigature0 module fulladder_fixture;\
\
reg a;\
reg b;\
reg cin;\
\
wire sum;\
wire cout;\
\
\
fulladder uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));\
\
initial\
begin\
a =0;\
b =0;\
cin =0;\
#20; a =1;\
#20; b =1;\
#20; a =0;\
#20; cin =1;\
#20; b=0;\
#20; a=1;\
#20; b=1;\
#40;\
end\
\
\
initial\
begin\
$monitor("time = %2d, CIN =%1b, A=%1b, B=%1b, COUT=%1b, SUM=%1b", $time, cin, a, b, cout, sum);\
end\
\
endmodule\
}
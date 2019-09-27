{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c100000;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs28 \cf2 \cb3 \CocoaLigature0 module rcadder_fixture;\
reg [3:0]a,b;\
reg carry_in;\
wire [3:0]sum;\
wire carry_out;\
rcadder uut (a,b, carry_in, sum, carry_out);\
\
initial\
begin\
$vcdpluson;\
$monitor($time," A=%b B=%b Cin=%b : Sum=%b, Cout=%b", a, b, carry_in, sum, carry_out);\
end\
\
//buffer\
reg [8:0] buff_in[255:0];\
reg [4:0] buff_out[255:0];\
reg [3:0] buff_sum;\
reg buff_cout;\
integer i;\
\
task testing;\
begin\
\
// load memory from file\
$readmemb("rcadder_ip.txt",buff_in);\
$readmemb("rcadder_op.txt",buff_out);\
\
//fill memory with constants\
for(i=0;i<256;i=i+1)\
\
begin\
\{a,b,carry_in\}=buff_in[i];\
#10;\
\{buff_cout, buff_sum\}=buff_out[i];\
if((buff_cout==carry_out) && (buff_sum==sum))\
$display("Test Passed");\
else\
$display("Test Failed");\
end\
end\
endtask\
\
initial begin\
testing;\
#5000 $finish;\
end\
endmodule}
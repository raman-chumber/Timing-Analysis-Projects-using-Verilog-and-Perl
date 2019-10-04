{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c100000;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs28 \cf2 \cb3 \CocoaLigature0 `include "fulladder.v"\
module rcadder (a, b, carry_in, sum, carry_out);\
input [3:0]a,b;\
input carry_in;\
output [3:0]sum;\
output carry_out;\
wire [2:0]w;\
fulladder fa0(a[0],b[0],carry_in ,sum[0],w[0]);\
fulladder fa1(a[1],b[1],w[0],sum[1],w[1]);\
fulladder fa2(a[2],b[2],w[1],sum[2],w[2]);\
fulladder fa3(a[3],b[3],w[2],sum[3],carry_out);\
endmodule}
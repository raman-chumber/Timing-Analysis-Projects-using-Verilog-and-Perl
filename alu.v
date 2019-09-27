{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c100000;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs28 \cf2 \cb3 \CocoaLigature0 module alu (A,B,ctrl,out);\
input signed [3:0] A,B;\
input ctrl;\
output reg signed [3:0] out;\
\
always @(*)\
\
begin\
   case (ctrl)\
   2'b00 : out = A + B;\
   2'b01 : out = A & B;\
   2'b10 : out = A << 1;\
   2'b11 : out = A >> 1;\
   endcase\
end\
\
endmodule}
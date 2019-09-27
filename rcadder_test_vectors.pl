{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c100000;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs28 \cf2 \cb3 \CocoaLigature0 #!usr/bin/perl\
$max_value=2**8;\
\
$f1='rcadder_ip.txt';\
open(file1,">>$f1");\
$f2='rcadder_op.txt';\
open(file2,">>$f2");\
\
for ($i=0; $i<$max_value; ++$i)\
 \{\
  $a=int(rand(16));\
  $b=int(rand(16));\
  $c=int(rand(2));\
  $a_in=sprintf("%04b",$a);\
  $b_in=sprintf("%04b",$b);\
  $c_in=sprintf("%b",$c);\
  $sum=$a+$b+$c;\
  $sum_in=sprintf("%05b",$sum);\
  print file1 "$a_in$b_in$c_in\\n";\
  print file2 "$sum_in\\n";\
 \}\
\
close(file1);\
close(file2);}
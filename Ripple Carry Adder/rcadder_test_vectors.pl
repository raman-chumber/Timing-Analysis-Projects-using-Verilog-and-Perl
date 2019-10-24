#!usr/bin/perl\
$max_value=2**8;

$f1='rcadder_ip.txt';
open(file1,">>$f1");
$f2='rcadder_op.txt';
open(file2,">>$f2");

for ($i=0; $i<$max_value; ++$i)
 {
    $a=int(rand(16));
    $b=int(rand(16));
    $c=int(rand(2));
    $a_in=sprintf("%04b",$a);
    $b_in=sprintf("%04b",$b);
    $c_in=sprintf("%b",$c);
    $sum=$a+$b+$c;
    $sum_in=sprintf("%05b",$sum);
    print file1 "$a_in$b_in$c_in\\n";
    print file2 "$sum_in\\n";
 }

close(file1);
close(file2);
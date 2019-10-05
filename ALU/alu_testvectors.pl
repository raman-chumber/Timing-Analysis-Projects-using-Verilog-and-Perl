#!/usr/bin/perl

for($i=0; $i<=15; ++$i)
{
 $A[$i] = $i;
 $B[$i] = int(rand(15));
 $ctrl[$i] = int(rand(4));
}

$file = "alutest.txt";
open(test,"> $file");

for($i=0; $i<=15; ++$i)
{
 $ADD[$i] = $A[$i] + $B[$i];
 $AND[$i] = $A[$i] & $B[$i];
 $SLL[$i] = $A[$i] << 1;
 $SRL[$i] = $A[$i] >> 1;

 printf test
 ("%04b_%04b_%02b_%04b_%04b_%04b_%04b \n",$A[$i],$B[$i],$ctrl[$i],$ADD[$i]&15,$AND[$i],$SLL[$i]&15,$SRL[$i]&15);
}

close(test);
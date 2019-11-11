use strict;
use warnings;

# Test data file 
my $input_file = "mem_ip.txt";
my $output_file = "mem_op.txt";

# Control signals 
my $cs_r=1;my $rd_r=0;my $oe_r=0;
my $cs_w=1;my $rd_w=1;my $oe_w=1;

my $i=0;my $j=0;my $k=0;

# Create random test data to store in file 
open(IP, ">$input_file");
open(OP, ">$output_file");
for ($k = 0; $k<20; $k++) {
    print IP "$cs_r$rd_r$oe_r";
    print OP "$cs_w$rd_w$oe_w";
    for ($i = 0; $i<5; $i++) {
       $j = int(rand(2));
       print IP "$j";
       print OP "$j";
    }
    print IP "\n";
    print OP "\n";
}
close(IP);
close(OP);
# Corner case
my $z = 'z';
open(IP,">>$input_file");
open(OP,">>$output_file");
for ($k=0;$k<4;$k++) {
   $j = int(rand(2));
   print IP "$cs_r$oe_r$rd_r$j$j";
   print OP "$cs_r$oe_r$rd_r$j$j";
   for ($i=0;$i<3;$i++) {
      print IP "$j";
      print OP "$z";
   }

 print IP "\n";
 print OP "\n";
}
close(IP);
close(OP);
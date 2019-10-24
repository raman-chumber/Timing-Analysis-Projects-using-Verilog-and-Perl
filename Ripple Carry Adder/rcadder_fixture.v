module rcadder_fixture;
reg [3:0]a,b;
reg carry_in;
wire [3:0]sum;
wire carry_out;

reg [8:0] buff_in[255:0];
reg [4:0] buff_out[255:0];
reg [3:0] buff_sum;
reg buff_cout;
integer i;

rcadder uut (a,b, carry_in, sum, carry_out);

initial
begin
$vcdpluson;
$monitor($time," A=%b B=%b Cin=%b : Sum=%b, Cout=%b", a, b, carry_in, sum, carry_out);
end

task testing;
begin

// load memory from file
$readmemb("rcadder_ip.txt",buff_in);
$readmemb("rcadder_op.txt",buff_out);

//fill memory with constants
for(i=0;i<256;i=i+1)

begin
{a,b,carry_in}=buff_in[i];
#10;
{buff_cout, buff_sum}=buff_out[i];
if((buff_cout==carry_out) && (buff_sum==sum))
$display("Test Passed");
else
$display("Test Failed");
end
end
endtask

initial begin\
testing;\
#5000 $finish;\
end\
endmodule}
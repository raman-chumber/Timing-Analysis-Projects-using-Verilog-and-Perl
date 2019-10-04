`include "alu.v";
module alu_fixture;
reg signed [3:0] A,B;
reg [1:0] ctrl_TB;
wire signed [3:0] out_TB;
reg signed [3:0] out_PL;
reg [25:0] mem [15:0];
reg [25:0] temp;

integer m=0,n=0;

//Instantiating the alu module
alu a1(.A(A),.B(B),.ctrl(ctrl_TB),.out(out_TB));


initial
begin
$dumpfile("alu.vcd");
$dumpvars(0,alu_fixture);
end

//Reading the Testvectors to mem
initial
begin
$readmemb("alu_pl_output.txt",mem);
end
initial
begin
display;
end

initial
begin

  while (m<=15)
  begin
    temp = mem[m];
    A = temp[25:22];
    B = temp[21:18];
    ctrl_TB = temp[17:16];

    #1;

    case(ctrl_TB)
    2'b00 : out_PL = temp[15:12];
    2'b01 : out_PL = temp[11:8];
    2'b10 : out_PL = temp[7:4];
    2'b11 : out_PL = temp[3:0];
    endcase

    m = m + 1;
    #9;
  end
end
task display;
begin

#10;
for (n=0;n<=15;n=n+1)
  begin
    if(out_TB == out_PL)
      begin
       $display("\t\t\t A   |   B   | Ctrl | Out_Verilog | Out_Perl |\n");
       $display($time, "   %b  | %b  |  %b  |     %b    |   %b   | \n",A,B,ctrl_TB,out_TB,out_PL);
       $display("PASS: ALU operations successful !!!\n");
      end
    else
      begin
       $display("\t\t\t A   |   B   | Control | Output_Verilog | Output_Perl |\n");
       $display($time, "   %b  | %b  |  %b  |     %b    |   %b   | \n",A,B,ctrl_TB,out_TB,out_PL);
       $display("FAIL: ALU operations not successful !!!\n");
      end
#10;
end

#700 $finish;
end
endtask

endmodule
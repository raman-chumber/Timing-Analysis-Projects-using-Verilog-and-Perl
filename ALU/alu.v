module alu (A,B,ctrl,out);
input signed [3:0] A,B;
input [1:0] ctrl;
output reg signed [3:0] out;

always @(*)

begin
   case (ctrl)
   2'b00 : out = A + B;
   2'b01 : out = A & B;
   2'b10 : out = A << 1;
   2'b11 : out = A >> 1;
   endcase
end

endmodule
# ALU 
## A). The ALU has three inputs: two 4‐bit signed values and a 2‐bit control signal that determines which operation the ALU should perform. The ALU has a single 4‐bit signed output, which is the result of the operation. The ALU can perform ADD, AND, SLL and SRL operations:
##Addition - 00
##Bitwise AND - 01
##Shift Left Logical - 10
##Shift Right Logical - 11

##B). A Perl program to automatically create the above “alutest.txt” file which is used in Verilog testbench. Verilog testbench is comparing the ALU outputs values with the ADD, AND, SLL and SRL values read from the “alutest.txt” file.
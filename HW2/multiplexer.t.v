// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg addr0, addr1;
  reg in0,in1,in2,in3;
  wire out;

  //behavioralMultiplexer multiplexer (out, addr0, addr1, in0, in1, in2, in3);
  structuralMultiplexer multiplexer (out, addr0, addr1, in0, in1, in2, in3);

  //run sequence of test stimuli
  initial begin
  $dumpfile("multiplexer.vcd");
  $dumpvars();
  $display("A0 A1 | O0 O1 O2 O3 | Output | Expected Output");

  in0=0;in1=0;in2=0;in3=0;addr0=0;addr1=0; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  0 ", addr0, addr1, in0, in1, in2, in3, out);
  in0=1;in1=0;in2=0;in3=0;addr0=0;addr1=0; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  1 ", addr0, addr1, in0, in1, in2, in3, out);

  in1=0;in0=0;in2=0;in3=0;addr0=1;addr1=0; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  0 ", addr0, addr1, in0, in1, in2, in3, out);
  in1=1;in0=0;in2=0;in3=0;addr0=1;addr1=0; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  1 ", addr0, addr1, in0, in1, in2, in3, out);

  in2=0;in0=0;in1=0;in3=0;addr0=0;addr1=1; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  0 ", addr0, addr1, in0, in1, in2, in3, out);
  in2=1;in0=0;in1=0;in3=0;addr0=0;addr1=1; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  1 ", addr0, addr1, in0, in1, in2, in3, out);

  in3=0;in1=0;in2=0;in0=0;addr0=1;addr1=1; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  0 ", addr0, addr1, in0, in1, in2, in3, out);
  in3=1;in1=0;in2=0;in0=0;addr0=1;addr1=1; #1000
  $display("%b  %b  | %b  %b  %b  %b  |    %b   |  1 ", addr0, addr1, in0, in1, in2, in3, out);
  $finish();
  end

endmodule

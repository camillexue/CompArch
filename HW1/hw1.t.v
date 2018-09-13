`include "hw1.v"

module demorgan_test ();

  //Instantiate device/module under hello_test
  reg A, B;
  wire nA, nB, nAandnB, nAndB, nAorB, nAornB;

  demorgan dut(A, B, nA, nB, nAandnB, nAandB, nAorB, nAornB); // module to be tested

  // run sequence of test stimuli
  initial begin
  $display("A B | ~A ~B | ~(AB) | (~A+~B) | ~(A+B) | (~A~B)  "); // prints header for truth table
  A=0;B=0; #1 // set A and B, wait for update
  $display("%b %b |  %b %b  |   %b   |    %b    |   %b    |   %b   ", A, B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
  A=0;B=1; #1
  $display("%b %b |  %b %b  |   %b   |    %b    |   %b    |   %b   ", A, B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
  A=1;B=0; #1
  $display("%b %b |  %b %b  |   %b   |    %b    |   %b    |   %b   ", A, B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
  A=1;B=1; #1
  $display("%b %b |  %b %b  |   %b   |    %b    |   %b    |   %b   ", A, B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
  $display("Since for all inputs A and B, ~(AB) and (~A+~B) have the same outputs, they must be equal. Similarly, since ~(A+B) and (~A~B) have the same outputs for each input A and B, they are also equal to each other.");
  end
endmodule

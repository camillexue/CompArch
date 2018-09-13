module demorgan
(
  input A, // single bit inputs
  input B,
  output nA, //output itermediate complemented inputs
  output nB,
  output nAandnB, // single bit output, (~A)*(~B)
  output nAandB, // (~(AB))
  output nAorB, // (~(A + B))
  output nAornB // ((~A)+(~B))
);

  wire nA;
  wire nB;
  not Ainv(nA, A); // top inverted named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);

  and andgate(nAandnB, nA, nB);  // AND gate produces nAandnB from nA and nB
  nand nandgate(nAandB, A, B);  // NAND gate produces nAandB from A and B
  or orgate(nAornB, nA, nB);  // OR gate produces nAornB from nA and nB
  nor norgate(nAorB, A, B); // NOR gate produces nAorB from A and B
endmodule

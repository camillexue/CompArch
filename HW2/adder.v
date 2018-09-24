// Adder circuit
`define AND and #50  //delays for gates
`define OR or #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    wire norAout, andAout, andBout;

    `XOR xorA(norAout, a, b);
    `AND andA(andAout, a, b);
    `XOR xorB(sum, norAout, carryin);
    `AND andB(andBout, norAout, carryin);
    `OR orgate(carryout, andAout, andBout);
endmodule

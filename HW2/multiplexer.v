// Multiplexer circuit
`define AND and #50  //delays for gates
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire naddr0, naddr1;
    `NOT A0inv(naddr0, address0);
    `NOT A1inv(naddr1, address1);
    wire outA,outB,outC,outD;

    `AND andgateA(outA, in0, naddr0, naddr1);
    `AND andgateB(outB, in1, address0, naddr1);
    `AND andgateC(outC, in2, naddr0, address1);
    `AND andgateD(outD, in3, address0, address1);
    `OR orgate(out, outA, outB, outC, outD);
endmodule

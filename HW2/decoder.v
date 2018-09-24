// Decoder circuit
`define AND and #50  //delays for gates
`define OR or #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input I0, I1, //same as address0 and address1, just inputs
    input enable
);
    wire nI0, nI1;
    `NOT I0inv(nI0, I0);
    `NOT I1inv(nI1, I1);

    `AND andgateA(out0, nI0, nI1, enable);
    `AND andgateB(out1, I0, nI1, enable);
    `AND andgateC(out2, nI0, I1, enable);
    `AND andgateD(out3, I0, I1, enable);
endmodule

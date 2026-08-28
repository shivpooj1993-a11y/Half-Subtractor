module half_subtractor (
    input  A,
    input  B,
    output Difference,
    output Borrow
);

    // Difference = A XOR B
    assign Difference = A ^ B;

    // Borrow = NOT A AND B
    assign Borrow = (~A) & B;

endmodule

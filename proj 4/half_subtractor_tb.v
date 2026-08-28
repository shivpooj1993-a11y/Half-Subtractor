`timescale 1ns/1ps

module half_subtractor_tb;

    // Testbench inputs
    reg A;
    reg B;

    // Testbench outputs
    wire Difference;
    wire Borrow;

    // Instantiate the Half Subtractor
    half_subtractor uut (
        .A(A),
        .B(B),
        .Difference(Difference),
        .Borrow(Borrow)
    );

    initial begin

        // Generate waveform file
        $dumpfile("simulation/half_subtractor.vcd");
        $dumpvars(0, half_subtractor_tb);

        // Display output
        $monitor("Time = %0t | A = %b | B = %b | Difference = %b | Borrow = %b",
                 $time, A, B, Difference, Borrow);

        // Test Case 1: 0 - 0
        A = 0;
        B = 0;
        #10;

        // Test Case 2: 0 - 1
        A = 0;
        B = 1;
        #10;

        // Test Case 3: 1 - 0
        A = 1;
        B = 0;
        #10;

        // Test Case 4: 1 - 1
        A = 1;
        B = 1;
        #10;

        // End simulation
        $finish;

    end

endmodule

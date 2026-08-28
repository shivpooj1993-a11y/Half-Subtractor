Half Subtractor using Verilog HDL
📌 Project Overview

A Half Subtractor is a combinational digital circuit used to perform the subtraction of two 1-bit binary numbers.

It has two inputs:

A – Minuend
B – Subtrahend

It produces two outputs:

Difference – Result of subtraction
Borrow – Borrow generated during subtraction

This project implements a Half Subtractor using Verilog HDL and verifies its functionality using a Verilog testbench.

🎯 Objectives
Design a 1-bit Half Subtractor using Verilog HDL.
Understand the logic behind binary subtraction.
Create a testbench to verify all possible input combinations.
Simulate the design and observe the output waveform.
Learn the basic workflow of digital design using Verilog.
🧮 Boolean Expressions

The Half Subtractor has the following Boolean expressions:

Difference
Difference = A XOR B

Borrow
Borrow = A' AND B


In Verilog:

assign Difference = A ^ B;
assign Borrow = (~A) & B;

📊 Truth Table
A	B	Difference	Borrow
0	0	0	0
0	1	1	1
1	0	1	0
1	1	0	0
🔧 Project Structure
half-subtractor/
│
├── README.md
│
├── src/
│   └── half_subtractor.v
│
├── tb/
│   └── half_subtractor_tb.v
│
└── simulation/
    └── half_subtractor.vcd

💻 Design Code

The Half Subtractor is implemented using two continuous assignments.

module half_subtractor (
    input  A,
    input  B,
    output Difference,
    output Borrow
);

    assign Difference = A ^ B;
    assign Borrow = (~A) & B;

endmodule

🧪 Testbench

The testbench applies all four possible combinations of the two inputs and displays the outputs.

`timescale 1ns/1ps

module half_subtractor_tb;

    reg A;
    reg B;

    wire Difference;
    wire Borrow;

    half_subtractor uut (
        .A(A),
        .B(B),
        .Difference(Difference),
        .Borrow(Borrow)
    );

    initial begin

        $dumpfile("simulation/half_subtractor.vcd");
        $dumpvars(0, half_subtractor_tb);

        $monitor("Time = %0t | A = %b | B = %b | Difference = %b | Borrow = %b",
                 $time, A, B, Difference, Borrow);

        A = 0; B = 0;
        #10;

        A = 0; B = 1;
        #10;

        A = 1; B = 0;
        #10;

        A = 1; B = 1;
        #10;

        $finish;
    end

endmodule

▶️ Simulation

This project can be simulated using Icarus Verilog and GTKWave.

Step 1: Install Icarus Verilog

On Ubuntu/Debian:

sudo apt update
sudo apt install iverilog

Step 2: Compile the design and testbench

From the project directory:

iverilog -o half_subtractor_sim src/half_subtractor.v tb/half_subtractor_tb.v

Step 3: Run the simulation
vvp half_subtractor_sim


Expected output:

Time = 0 | A = 0 | B = 0 | Difference = 0 | Borrow = 0
Time = 10000 | A = 0 | B = 1 | Difference = 1 | Borrow = 1
Time = 20000 | A = 1 | B = 0 | Difference = 1 | Borrow = 0
Time = 30000 | A = 1 | B = 1 | Difference = 0 | Borrow = 0

📈 View the Waveform

The testbench generates:

simulation/half_subtractor.vcd


You can open the waveform using GTKWave:

gtkwave simulation/half_subtractor.vcd


Add the following signals to the waveform viewer:

A
B
Difference
Borrow


The waveform should show:

Time	A	B	Difference	Borrow
0 ns	0	0	0	0
10 ns	0	1	1	1
20 ns	1	0	1	0
30 ns	1	1	0	0
✅ Verification

The simulation confirms that the Half Subtractor produces the expected Difference and Borrow outputs for all possible combinations of inputs.

Therefore, the Verilog implementation successfully matches the Half Subtractor truth table.

📚 Applications

Half Subtractors are useful for understanding the basic principles of binary subtraction and are used as building blocks when designing more complex arithmetic circuits such as:

Full subtractors
Binary subtractors
Arithmetic Logic Units (ALUs)
Digital arithmetic circuits
🏁 Conclusion

In this project, a 1-bit Half Subtractor was designed using Verilog HDL. A testbench was created to verify all possible input combinations, and the design was simulated using Icarus Verilog. The generated VCD waveform can be viewed using GTKWave.

The simulation results match the theoretical truth table, confirming the correct operation of the Half Subtractor.
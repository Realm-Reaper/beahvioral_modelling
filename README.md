# ⚡ DLCD Basics: Fundamental Combinational Circuits

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Verilog/VHDL](https://img.shields.io/badge/HDL-Verilog%20%7C%20VHDL-blue.svg)](#)
[![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen.svg)](#)

Welcome to the **DLCD Basics** repository! This project serves as a foundational library of core Digital Logic Circuit Design (DLCD) components. It contains the source code and simulation testbenches for standard combinational logic circuits, perfect for learning, reference, or integration into larger digital system designs.

## 📖 Table of Contents
- [Overview](#overview)
- [Included Circuits](#included-circuits)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Simulation & Testing](#simulation--testing)
- [Contributing](#contributing)
- [License](#license)

## 🔭 Overview
Combinational logic circuits are the building blocks of digital electronics and arithmetic logic units (ALUs). This repository provides clean, well-documented implementations of fundamental adders and subtractors. Each module includes its corresponding testbench to verify its truth table and transient behavior.

## 🛠️ Included Circuits

### 1. Basic Arithmetic
* **Half Adder (`half_adder`)**: Adds two single-bit binary numbers, producing a Sum and a Carry.
* **Full Adder (`full_adder`)**: Adds three single-bit binary numbers (two operands and a Carry-In), producing a Sum and a Carry-Out.
* **Half Subtractor (`half_subtractor`)**: Subtracts one single-bit binary number from another, producing a Difference and a Borrow.
* **Full Subtractor (`full_subtractor`)**: Subtracts two single-bit binary numbers accounting for a Borrow-In, producing a Difference and a Borrow-Out.

### 2. Multi-Bit Arithmetic
* **Ripple Carry Adder (`rca`)**: Cascades multiple Full Adders to add N-bit binary numbers. (Configurable bit-width).
* **BCD Adder (`bcd_adder`)**: Adds two 4-bit Binary Coded Decimal (BCD) digits and correctly formats the output back into valid BCD (handling the +6 correction logic when sums exceed 9).

## 📂 Project Structure

A standard separation of design sources and simulation testbenches is maintained:


dlcd_basics/
│
├── src/                      # RTL Design Source Files
│   ├── half_adder.v          
│   ├── full_adder.v
│   ├── half_subtractor.v
│   ├── full_subtractor.v
│   ├── rca.v                 # Ripple Carry Adder
│   └── bcd_adder.v           # Binary Coded Decimal Adder
│
├── tb/                       # Simulation Testbenches
│   ├── tb_half_adder.v
│   ├── tb_full_adder.v
│   └── ... (other testbenches)
│
├── waves/                    # Generated waveform files (.vcd) - Ignored in Git
└── README.md                 
(Note: Change the .v extension to .vhd if you are using VHDL instead of Verilog).

🚀 Getting Started
Prerequisites
To compile and simulate these circuits, you will need an HDL simulator. Popular options include:

Icarus Verilog (iverilog) & GTKWave (Open Source)

ModelSim / QuestaSim

Xilinx Vivado

Installation
Clone this repository to your local machine:

Bash
git clone [https://github.com/YourUsername/dlcd-basics.git](https://github.com/YourUsername/dlcd-basics.git)
cd dlcd-basics
🧪 Simulation & Testing
If you are using Icarus Verilog, you can run a simulation from the terminal. Here is an example of how to test the Full Adder:

Compile the design and testbench:

Bash
iverilog -o sim_fa src/full_adder.v tb/tb_full_adder.v
Run the simulation:

Bash
vvp sim_fa
View the waveforms:
(Ensure your testbench includes $dumpfile and $dumpvars to generate a .vcd file)

Bash
gtkwave waves/full_adder_waves.vcd

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.


### Quick Tips for Implementation:
1. **File Extensions:** If your code is VHDL, remember to change the `.v` references to `.vhd` or `.vhdl`.
2. **Toolchain:** I defaulted the simulation instructions to Icarus Verilog as it is the


# Arithmetic Logic Unit (ALU) in Verilog

## 📘 Project Overview

This project is a low-level implementation of an Arithmetic Logic Unit (ALU) written entirely in Verilog HDL. It focuses on providing fundamental arithmetic functionalities such as addition, subtraction, multiplication, division, and modulus — all without using high-level arithmetic operators. Instead, the design uses bitwise logic, shifting, and low-level control to achieve functionality closer to hardware-level execution.

The ALU is capable of working with signed 8-bit integers and converting the result to Binary-Coded Decimal (BCD) for display. The project demonstrates a deep understanding of RTL (Register Transfer Level) design, modular architecture, and hardware-oriented thinking.

---

## 🔧 Core Features

- **Signed Input Support:** Operands A and B are 8-bit signed numbers.
- **Operation Control:** A 3-bit control signal determines which arithmetic operation to perform.
- **Supported Operations:**
  - Addition
  - Subtraction
  - Multiplication
  - Division
  - Modulus
- **BCD Output:** Converts binary results to decimal format using a Binary-to-BCD converter for easy display.
- **Low-Level RTL Design:** All arithmetic is done using RTL techniques; no use of Verilog arithmetic operators like `+`, `-`, `*`, or `/` in core logic.
- **Modular Structure:** Clean, separated logic for arithmetic, conversion, and control for easy testing and reuse.

---

## 🧠 Design Highlights

- The ALU performs all arithmetic operations using gate-level constructs such as shift registers, accumulators, and comparators.
- All logic was built from scratch to simulate the internal operation of real digital circuits.
- Binary-to-BCD conversion is handled using the "Double Dabble" algorithm.
- The project ensures correct handling of signed numbers using two's complement representation.

---

## 🖥️ How It Works

1. **Inputs:**
   - Operand A: 8-bit signed number
   - Operand B: 8-bit signed number
   - Operation Code: 3-bit signal to select the arithmetic operation

2. **Output:**
   - Binary result of the selected operation
   - Equivalent BCD value (for display)
   - Negative result flag

3. **Flow:**
   - User inputs two signed integers and selects the desired operation.
   - The ALU executes the operation using RTL logic.
   - The output is calculated in binary and then converted to BCD.
   - Flags are set accordingly (e.g., if the result is negative).

---

## 🧪 Testing and Validation

- Exhaustive test scenarios were applied for each operation.
- Edge cases such as negative results, zero division handling, overflow, and sign extension were considered.
- BCD outputs were verified against known decimal equivalents.
- Each module was simulated in isolation and then integrated for full-system testing.

---

## ⚙️ Tools and Environment

- **Language:** Verilog HDL (RTL)
- **Simulation Tools:** ModelSim / Vivado / Quartus (any Verilog-compatible simulator)
- **Target Platforms:** FPGA synthesis-capable (optional extension)
- **Display Compatibility:** Output formatted for potential LCD or 7-segment display interfacing

---

## 🚀 Future Extensions

- Incorporation of logical operations (AND, OR, XOR, NOT)
- Support for floating-point arithmetic
- Hardware display integration (7-segment / LCD)
- FSM control for multi-cycle operation execution
- Add support for pipeline design for performance

---

## 👨‍💻 Author

- **Name:** Muhammad Khaled
- **University:** Cairo University
- **Department:** Computer Engineering
- **Year:** Junior (2025)
- **Interests:** RTL Design, Hardware Simulation, Embedded Systems, Creative Digital Circuits

---

## 📌 Summary

This ALU project is a demonstration of low-level hardware logic construction using Verilog. Rather than relying on pre-defined arithmetic operators, all logic is carefully constructed to reflect how hardware operates at the gate and register level. It highlights strong fundamentals in computer architecture, digital logic, and hardware design, providing a powerful foundation for future embedded or FPGA-based projects.

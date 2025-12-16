# Simple General-Purpose Processor (VHDL)

**Course:** COE 328 – Digital Systems  
**School:** Toronto Metropolitan University  
**Lab:** 6 – Simple General-Purpose Processor  
**Platform:** Quartus II 13.0 / VHDL  
**Board:** Cyclone II FPGA development board  
**Chip/Device:** EP2C35F672C6

---

## Objectives

- Design and implement a **simple 8-bit general-purpose processor** using VHDL.  
- Build a modular system consisting of:
  - **Registers** (storage units)
  - **Arithmetic Logic Unit (ALU)**
  - **Finite State Machine (FSM)** control unit
  - **4-to-16 Decoder** for microcode generation
- Implement multiple **arithmetic and logical operations** selected via FSM-generated microcode.
- Modify and extend the design across **three stages**:
  - Initial ALU design  
  - Modified ALU with extended operations  
  - Modified control unit behavior

---

## System Overview

The processor follows a simplified hardware architecture where:
- Two 8-bit inputs are stored in registers
- An FSM sequences through states
- A decoder converts FSM states into **microcode**
- The ALU executes operations based on the active microcode

---

## Repository Structure

    Part1ALU/
    ├── *.vhd          # Initial ALU, FSM, decoder, and register designs
    ├── *.bdf          # Block diagrams for Part 1 system integration

    Part2ModifiedALU/
    ├── *.vhd          # Extended ALU with additional arithmetic and logic operations
    ├── *.bdf          # Updated block diagrams for modified ALU

    Part3ModifiedControlUnit/
    ├── *.vhd          # Modified FSM and control logic implementation
    ├── *.bdf          # Block diagrams for final system configuration

    Screenshots/
    └── Block diagrams and waveform verification images

Each folder represents an **independent Quartus project** corresponding to a different stage of the processor design.

---

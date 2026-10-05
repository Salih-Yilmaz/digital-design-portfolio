# Digital Design Portfolio

A collection of digital hardware design and RTL projects developed while learning FPGA-based digital design.

## Projects

### 01 — Combinational Logic

Fundamental combinational logic design and Boolean optimization.

- Minterm-based combinational logic
- Truth tables and Boolean expressions
- Karnaugh map simplification
- Structural and dataflow RTL design
- Behavioral simulation
- RTL elaboration
- Synthesis and FPGA resource analysis
- Comparison of simplified and unsimplified implementations

### 02 — Arithmetic Unit

Hierarchical RTL design of a 2-bit arithmetic unit.

- Half Adder and Full Adder
- Hierarchical 2-bit Ripple Carry Adder
- 2-bit binary multiplier
- Partial-product based multiplication
- Opcode-controlled operation selection
- 2:1 MUX-based arithmetic operation selection
- Exhaustive behavioral simulation
- RTL hierarchy and schematic analysis
- FPGA synthesis and resource utilization analysis

#### Operations

| Opcode | Operation |
|--------|-----------|
| `0` | Addition |
| `1` | Multiplication |

The arithmetic unit accepts two 2-bit unsigned inputs and produces a 4-bit result.

## Design Approach

The projects are developed with a focus on understanding digital hardware from the logic level up to FPGA implementation.

The general design workflow is:

```text
Boolean Logic
      ↓
RTL Design
      ↓
Module Hierarchy
      ↓
Testbench
      ↓
Behavioral Simulation
      ↓
RTL Elaboration
      ↓
Synthesis
      ↓
Resource Analysis

# Digital Design Portfolio

A collection of digital hardware design and RTL projects developed while learning FPGA-based digital design, Verilog, simulation, and synthesis.

The portfolio progresses from fundamental combinational logic to arithmetic circuits, clock division, and finite state machine (FSM) design.

## Projects

### 01 — Combinational Logic

Fundamental combinational logic design and Boolean optimization.

- Minterm-based logic implementation
- Truth tables and Boolean expressions
- Karnaugh map simplification
- Structural and dataflow RTL design
- Exhaustive behavioral simulation
- RTL elaboration and schematic analysis
- Synthesis and FPGA resource utilization
- Comparison of simplified and unsimplified implementations

### 02 — Arithmetic Unit

Hierarchical RTL design of a 2-bit arithmetic unit.

- Half Adder and Full Adder
- Hierarchical 2-bit ripple-carry adder
- 2-bit binary multiplier
- Partial-product-based multiplication
- Opcode-controlled operation selection
- 2:1 multiplexer-based result selection
- Exhaustive behavioral simulation
- RTL hierarchy and schematic analysis
- FPGA synthesis and resource utilization analysis

#### Operations

| Opcode | Operation |
|:---:|---|
| `0` | Addition |
| `1` | Multiplication |

The arithmetic unit accepts two 2-bit unsigned inputs and produces a 4-bit result.

### 03 — 7-Segment Decoder

Combinational logic design for a 3-bit input to 7-segment output decoder.

- Truth table construction
- Boolean function derivation for individual segments
- Karnaugh map simplification
- Dataflow RTL implementation
- Behavioral simulation of all input combinations
- RTL elaboration and post-synthesis schematic analysis
- FPGA resource utilization analysis

The decoder generates seven segment control signals (`A`–`G`) for the specified input patterns.

### 04 — Clock Scaler

A configurable clock frequency divider using a counter and combinational selection logic.

- 16-bit counter design
- Positive-edge-triggered sequential logic
- Clock frequency division using counter bits
- `case`-based output selection
- Behavioral simulation of selectable frequencies
- RTL elaboration and synthesis analysis
- LUT, flip-flop, and I/O utilization analysis
- Investigation of synthesis optimization

#### Frequency Selection

| `sel` | Output Frequency |
|:---:|---:|
| `1` | 50 MHz |
| `2` | 25 MHz |
| `3` | 12.5 MHz |
| `4` | 6.25 MHz |

The design uses a 100 MHz input clock. Each successive counter bit operates at half the frequency of the preceding bit.

### 05 — Traffic Light FSM

A Moore finite state machine (FSM) for controlling a two-road traffic light system.

- Six-state FSM design
- Binary state encoding
- Current-state and next-state logic
- Clock-driven state register
- Counter-based state timing
- Synchronous reset
- Moore output logic
- Behavioral simulation with a dedicated testbench
- Verification of state transitions and timing behavior
- RTL elaboration and post-synthesis schematic analysis
- FPGA resource utilization analysis

The controller uses a vehicle sensor input (`SB`) to determine when the main-road green phase should transition. The traffic light outputs depend on the current FSM state.

The design combines sequential state management, counter-based timing, and combinational output logic in a single controller.

## Design Workflow

The projects follow a structured digital design workflow:

1. Analyze the design requirements.
2. Construct truth tables, Boolean expressions, or state diagrams.
3. Implement the design in RTL.
4. Develop a testbench.
5. Run behavioral simulation.
6. Inspect the elaborated RTL schematic.
7. Perform synthesis.
8. Analyze the synthesized design and FPGA resource utilization.

## Tools and Technologies

- **HDL:** Verilog
- **Design and simulation:** AMD Xilinx Vivado 2022.2
- **Target platform:** FPGA-oriented RTL design
- **Verification:** Behavioral simulation and testbenches
- **Analysis:** RTL schematics, synthesized schematics, and resource utilization reports
- **Version control:** Git and GitHub

## Repository Structure

```text
digital-design-portfolio/
├── 01-combinational-logic/
├── 02-arithmetic-unit/
├── 03-7segment-decoder/
├── 04-clock-scaler/
├── 05-traffic-light-fsm/
└── README.md
```

Each project contains its RTL source files and testbench, along with relevant simulation and synthesis results where available.

## Learning Objectives

- Understand the relationship between Boolean logic and digital hardware.
- Develop modular and hierarchical RTL designs.
- Understand combinational and sequential logic.
- Design arithmetic circuits, counters, and finite state machines.
- Verify hardware behavior through simulation.
- Interpret synthesis results and FPGA resource utilization.
- Build a foundation for more advanced FPGA and digital IC design projects.

This portfolio is an ongoing learning project focused on developing practical RTL design skills and understanding how HDL descriptions are translated into digital hardware.

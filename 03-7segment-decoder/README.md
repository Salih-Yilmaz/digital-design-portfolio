# 03 — 7-Segment Decoder

A 3-to-7 decoder designed to drive a 7-segment display from a 3-bit input.

## Design

The decoder accepts three input bits:

- `x2`
- `x1`
- `x0`

and generates seven segment control outputs:

- `A`
- `B`
- `C`
- `D`
- `E`
- `F`
- `G`

The input combinations are mapped to the following 7-segment patterns:

| x2 | x1 | x0 | Display |
|----|----|----|---------|
| 0 | 0 | 0 | Don't-care |
| 0 | 0 | 1 | `1` |
| 0 | 1 | 0 | `F` |
| 0 | 1 | 1 | `2` |
| 1 | 0 | 0 | `A` |
| 1 | 0 | 1 | `b` |
| 1 | 1 | 0 | `C` |
| 1 | 1 | 1 | `8` |

## Design Flow

```text
Truth Table
     ↓
Karnaugh Maps
     ↓
Boolean Simplification
     ↓
Dataflow SystemVerilog
     ↓
Behavioral Simulation
     ↓
RTL Elaboration
     ↓
Synthesis
     ↓
FPGA Resource Mapping
```

## RTL Approach

Each 7-segment output is described as an independent Boolean function of `x2`, `x1`, and `x0`.

The design uses SystemVerilog continuous assignments (`assign`) to describe the combinational logic.

## Verification

The testbench applies all eight possible 3-bit input combinations at 10 ns intervals and observes all seven segment outputs.

## Synthesis

The synthesized design maps the seven segment functions to FPGA LUT resources.

## Tools

- SystemVerilog
- AMD Xilinx Vivado 2022.2
- Behavioral simulation
- RTL elaboration
- Logic synthesis
- FPGA resource utilization analysis

## Repository Structure

```text
03-7segment-decoder/
│
├── README.md
├── rtl/
│   └── decoder_7seg.sv
├── testbench/
│   └── tb_decoder_7seg.sv
├── simulation/
│   └── decoder_7seg_waveform.png
└── synthesis/
    ├── rtl_elaborated_schematic.png
    ├── post_synthesis_schematic.png
    └── utilization.png
```

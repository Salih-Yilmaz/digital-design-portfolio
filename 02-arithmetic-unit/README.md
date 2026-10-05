# 2-Bit Arithmetic Unit — Hierarchical RTL Design

A small hierarchical RTL arithmetic unit implemented in SystemVerilog and verified with behavioral simulation.

## Architecture

```text
arithmetic_unit
├── ADDER
│   └── two_bit_adder
│       ├── half_adder
│       └── full_adder
│
├── MULTI
│   └── two_bit_multiplier
│       ├── half_adder
│       └── half_adder
│
└── opcode-controlled MUX
    ├── opcode = 0 → ADD
    └── opcode = 1 → MULTIPLY
```

## Function

Two 2-bit unsigned inputs are used:

- `A = A1 A0`
- `B = B1 B0`

The `opcode` selects the operation:

| Opcode | Operation | Result |
|---|---|---|
| `0` | Addition | 4-bit zero-extended result |
| `1` | Multiplication | 4-bit result |

The multiplier is implemented structurally from partial products and two Half Adders rather than using a built-in multiplication operator.

## RTL hierarchy

1. `half_adder` implements Sum and Carry.
2. `full_adder` implements Sum and Carry-out with `Cin`.
3. `two_bit_adder` combines one Half Adder and one Full Adder.
4. `two_bit_multiplier` generates four partial products and combines them with two Half Adders.
5. `arithmetic_unit` instantiates the adder and multiplier and selects their outputs using `opcode`.

## Verification

The testbench exhaustively checks all 16 combinations of the two 2-bit inputs for both operations:

- 16 addition cases
- 16 multiplication cases
- 32 total test vectors

The testbench does not use `+` or `*` to calculate the expected result. The waveform is inspected against the designed hardware behavior.

## Simulation result

The behavioral simulation confirms:

- Addition results from `0` through `6`
- Multiplication results from `0` through `9`
- Correct operation selection by `opcode`

See `simulation/arithmetic_unit_waveform.png`.

## Synthesis result

The synthesized design uses:

- LUT: **2 / 8000 (0.03%)**
- I/O: **9 / 150 (6.00%)**

The synthesis views in `synthesis/` show the RTL hierarchy and the mapping of the final logic into FPGA LUT resources.

## Repository structure

```text
02-arithmetic-unit/
├── README.md
├── rtl/
│   ├── half_adder.sv
│   ├── full_adder.sv
│   ├── two_bit_adder.sv
│   ├── two_bit_multiplier.sv
│   └── arithmetic_unit.sv
├── testbench/
│   └── tb_arithmetic_unit.sv
├── simulation/
│   └── arithmetic_unit_waveform.png
└── synthesis/
    ├── rtl_elaborated_schematic.png
    ├── rtl_hierarchy.png
    ├── post_synthesis_lut_mapping.png
    └── utilization.png
```

## Tools

- SystemVerilog
- AMD Xilinx Vivado 2022.2
- Behavioral simulation
- RTL elaboration
- Synthesis / resource utilization analysis

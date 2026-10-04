# Problem 1 — Combinational Logic

## 1. Problem

Two 2-bit numbers are given:

- `A = A1A0`
- `B = B1B0`

The output `F` must be:

- `F = 1` if the number of set bits in `A` is greater than or equal to the number of set bits in `B`.
- `F = 0` otherwise.

Example:

```text
A = 11 → two set bits
B = 01 → one set bit

Therefore F = 1
```

---

## 2. Truth Table

All 16 possible input combinations were examined.

The output is:

```text
F = Σm(0, 4, 5, 6, 8, 9, 10, 12, 13, 14, 15)
```

The complete truth table is available in `truth_table.md`.

---

## 3. Boolean Representation

For every input combination where `F = 1`, a minterm was created.

For example:

```text
A1 A0 B1 B0 = 1 0 0 1
```

corresponds to:

```text
A1 · ~A0 · ~B1 · B0
```

All required minterms are then ORed together to obtain `F`.

---

## 4. RTL Implementation

The Boolean expression was implemented in Verilog/SystemVerilog using `assign` statements.

The design file is:

```text
rtl/combinational_logic.sv
```

The implementation follows the minterm-based Boolean expression without performing Boolean simplification.

---

## 5. Testbench

A testbench was created to apply all 16 possible input combinations.

Each combination is applied for 10 ns.

```text
00 00
00 01
00 10
...
11 11
```

The testbench is:

```text
testbench/tb_combinational_logic.sv
```

---

## 6. Simulation

The simulation waveform was checked against the truth table.

All 16 input combinations produced the expected output.

Waveform:

```text
simulation/waveform.png
```

---

## 7. RTL Schematic

The elaborated RTL schematic shows the minterm-based AND/OR logic generated from the Verilog description.

```text
synthesis/rtl_schematic.png
```

---

## 8. Synthesis

After synthesis, Vivado mapped the complete Boolean function to a single 4-input LUT.

Resource usage:

- LUT: 1
- I/O: 5

The four inputs are `A1`, `A0`, `B1`, `B0`, and the output is `F`.

Utilization:

```text
synthesis/utilization.png
```

Post-synthesis schematic:

```text
synthesis/post_synthesis_schematic.png
```

---

## 9. Result

The design was successfully:

1. Defined with a truth table
2. Converted to minterms
3. Implemented in RTL
4. Verified with simulation
5. Synthesized in Vivado
6. Mapped to one LUT4

This project demonstrates the basic RTL design flow for a combinational digital circuit.

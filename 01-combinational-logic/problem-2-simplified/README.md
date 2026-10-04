# Problem 2 — Boolean Simplification

## 1. Problem

The same combinational function from Problem 1 is implemented after Boolean simplification.

`F = 1` when the number of set bits in `A` is greater than or equal to the number of set bits in `B`.

## 2. Simplified Expression

```text
F = A1A0 + A0~B1 + A1~B0 + A1~B1 + A0~B0 + ~B1~B0
```

## 3. RTL Implementation

The simplified expression was implemented using Verilog `assign`, AND (`&`), OR (`|`) and NOT (`~`) operators.

## 4. Verification

All 16 possible input combinations were applied. The simulation produced the same output behavior as Problem 1.

## 5. RTL Schematic

- RTL cells: 13
- Nets: 17
- I/O ports: 5

The simplified expression produces a much smaller RTL representation than Problem 1.

## 6. Synthesis

- LUT: 1
- I/O: 5

Both implementations fit into one LUT4. This shows that a smaller RTL expression does not necessarily reduce FPGA resource usage when the complete function already fits into one LUT.

## 7. Problem 1 vs Problem 2

| | Problem 1 | Problem 2 |
|---|---:|---:|
| RTL Cells | 32 | 13 |
| Nets | 36 | 17 |
| LUT | 1 | 1 |
| I/O Ports | 5 | 5 |

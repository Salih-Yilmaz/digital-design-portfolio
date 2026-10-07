# 04 - Clock Scaler

A 100 MHz input clock is divided into lower-frequency clock signals using a counter. A 4-bit `sel` input selects one of the divided signals for `clk_out`.

## Frequency selection

| `sel` | Selected counter bit | Output frequency |
|---|---|---:|
| `1` | `counter[0]` | 50 MHz |
| `2` | `counter[1]` | 25 MHz |
| `3` | `counter[2]` | 12.5 MHz |
| `4` | `counter[3]` | 6.25 MHz |

## Design

The counter is incremented on every rising edge of `clk_in`:

```verilog
always @(posedge clk_in)
begin
    counter <= counter + 1;
end
```

The selected counter bit is routed to `clk_out` using combinational `case` logic.

## Verification

The testbench generates a 100 MHz clock with a 10 ns period (`#5` half-period) and tests `sel = 1, 2, 3, 4` sequentially.

The waveform verifies the changing output period for each selection.

## Synthesis observations

The synthesized design maps the counter to flip-flops and FPGA carry-chain logic, while the selection logic is implemented using LUT resources.

Observed utilization:

- LUT: 3 / 8000 (0.04%)
- FF: 4 / 16000 (0.03%)
- IO: 6 / 150 (4.00%)

## Tools

- Verilog / SystemVerilog
- Vivado 2022.2
- Behavioral simulation
- RTL elaboration
- Synthesis
- FPGA resource analysis

## Project structure

```text
04-clock-scaler/
├── README.md
├── rtl/
│   └── clock_scaler.sv
├── testbench/
│   └── tb_clock_scaler.sv
├── simulation/
│   └── clock_scaler_waveform.png
└── synthesis/
    ├── rtl_elaborated_schematic.png
    ├── post_synthesis_schematic.png
    └── utilization.png
```

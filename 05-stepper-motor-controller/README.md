# Stepper Motor Controller

A four-state Moore FSM for controlling a stepper motor's coil activation sequence, implemented in Verilog and tested in Vivado.

## Features

- Four-state finite state machine (FSM)
- Clocked state register with asynchronous active-low reset (`rst_n`)
- Enable input to hold the current position when disabled
- Direction input for clockwise (CW) and counter-clockwise (CCW) state sequences
- Moore output logic mapping each state to a 4-bit coil pattern
- Behavioral testbench covering reset, forward rotation, hold, and reverse rotation
- RTL elaboration, post-synthesis schematic, and FPGA resource utilization report

## State and Coil Mapping

| State | `coil[3:0]` |
|:---:|:---:|
| `S0` | `1000` |
| `S1` | `0100` |
| `S2` | `0010` |
| `S3` | `0001` |

## State Sequences

- **CW (`dir = 1`, `en = 1`):** `S0 -> S1 -> S2 -> S3 -> S0`
- **CCW (`dir = 0`, `en = 1`):** `S0 -> S3 -> S2 -> S1 -> S0`
- **Hold (`en = 0`):** the current state and coil output are retained.
- **Reset (`rst_n = 0`):** the FSM asynchronously returns to `S0`.

## Repository Contents

```text
05-stepper-motor-controller/
├── README.md
├── rtl/
│   └── stepper_motor_controller.v
├── testbench/
│   └── tb_stepper_motor_controller.v
├── simulation/
│   └── stepper_motor_waveform.png
└── synthesis/
    ├── rtl_elaborated_schematic.png
    ├── post_synthesis_schematic.png
    └── utilization.png
```

## Tools

- HDL: Verilog
- Design and simulation: AMD Xilinx Vivado 2022.2
- Verification: Behavioral simulation with a dedicated testbench
- Analysis: RTL schematics and FPGA resource utilization

## Resource Utilization

The captured synthesis report shows 4 LUTs, 2 flip-flops, and 8 I/O pins used. These results are specific to the shown synthesis configuration and target device.

# Lift-Control-using-Verilog-
4-Floor Lift Controller using Verilog HDL and Finite State Machine (FSM)

# Elevator Controller using Verilog HDL

## Overview

This project implements a 4-floor Lift Controller using Verilog HDL and a Finite State Machine (FSM).

The elevator accepts floor requests, moves upward or downward depending on the destination floor, opens the door upon reaching the target floor, and returns to the idle state after a fixed delay.

---

## Features

* 4-floor elevator system
* Finite State Machine (FSM) based design
* Upward and downward movement
* Door open/close control
* Destination floor storage using target_floor register
* Asynchronous reset

---

## Floor Encoding

| Floor   | Binary |
| ------- | ------ |
| Floor 0 | 00     |
| Floor 1 | 01     |
| Floor 2 | 10     |
| Floor 3 | 11     |

---

## FSM States

| State | Description           |
| ----- | --------------------- |
| REST  | Waiting for a request |
| UP    | Moving upward         |
| DOWN  | Moving downward       |
| DOOR  | Door open state       |

---

## Inputs

* clk
* reset
* request[1:0]

---

## Outputs

* current[1:0]
* moving_up
* moving_down
* door

---

## Tools Used

* Verilog HDL
* Xilinx Vivado Simulator

---

## Simulation

Simulation verifies:

* Floor requests
* Upward movement
* Downward movement
* Door operation
* FSM transitions

---

## Author

Pranav Ganesh S
B.Tech Electronics and Communication Engineering
Aspiring VLSI Design Verification Engineer

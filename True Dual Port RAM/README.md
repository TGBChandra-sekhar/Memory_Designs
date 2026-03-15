# True Dual-Port RAM (Verilog Implementation)

## Overview
This project implements a **parameterized True Dual-Port RAM** using **Verilog HDL**.

The memory supports **two fully independent ports (Port A and Port B)**.  
Each port can **independently perform read or write operations**, allowing **simultaneous access** to the same memory from two different clock domains.

The design is written in a **synthesizable style** that allows **Block RAM (BRAM) inference** in FPGA tools such as **Xilinx Vivado**.

---

## Features
- Two **fully independent ports**
- Each port supports **read and write**
- **Independent clocks** for Port A and Port B
- Parameterized **address width** and **data width**
- **Simultaneous read/write operations**
- Synchronous memory behavior
- Compatible with **FPGA BRAM inference**
- Includes a **parameterized testbench**

---

## Memory Configuration

| Parameter | Description |
|---------|-------------|
| `ADDR_WIDTH` | Number of address bits |
| `DATA_WIDTH` | Width of each memory word |
| `DEPTH` | Total memory locations (2^ADDR_WIDTH) |

Example configuration:

ADDR_WIDTH = 10  
DATA_WIDTH = 8  

Memory Size = **1024 × 8 bits**

---

## Architecture

A **True Dual-Port RAM** consists of:

- **Port A**
  - Clock
  - Write enable
  - Address
  - Write data
  - Read data

- **Port B**
  - Clock
  - Write enable
  - Address
  - Write data
  - Read data

Both ports access a **shared memory array** and operate **independently**, even on **different clocks**.

---

## Operation

- **Write Operation**  
  When `we_a` or `we_b` is asserted, the corresponding port writes data into memory at the given address.

- **Read Operation**  
  Data is read synchronously and appears on the output **after the rising edge of the respective clock**.

- **Simultaneous Access**  
  Both ports can read, write, or perform read/write operations at the same time.

---

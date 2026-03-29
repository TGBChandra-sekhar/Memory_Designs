# Asynchronous FIFO (Async FIFO)

## 1. Introduction

An **Asynchronous FIFO (First-In First-Out)** is a hardware buffer used to safely transfer data between **two different clock domains**:
- **Write clock domain (`wr_clk`)**
- **Read clock domain (`rd_clk`)**

These clocks are **independent and asynchronous** (no fixed phase or frequency relationship).  
Async FIFOs are widely used in **CDC (Clock Domain Crossing)** designs such as:
- SoC interconnects
- High-speed interfaces
- DSP pipelines
- Network routers
- Memory subsystems

---

## 2. Why Async FIFO is Needed

Directly passing data between two unrelated clocks can cause:
- **Metastability**
- **Data corruption**
- **Unpredictable hardware failures**

Async FIFO provides:
- Safe data transfer
- Flow control (FULL / EMPTY)
- Clock domain isolation

---

## 3. Basic Architecture

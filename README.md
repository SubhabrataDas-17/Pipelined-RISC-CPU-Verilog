🚀 5-Stage Pipelined RISC CPU (Verilog)

Designed and implemented a 32-bit 5-stage pipelined RISC CPU in Verilog with hazard detection and forwarding mechanisms using Xilinx Vivado.

---

📌 Overview

This project implements a pipelined RISC processor architecture to improve instruction throughput by executing multiple instructions simultaneously across different stages.

🧠 Pipeline Stages:

- IF – Instruction Fetch
- ID – Instruction Decode
- EX – Execute
- MEM – Memory Access
- WB – Write Back

---

⚙️ Features

- 32-bit RISC architecture
- 5-stage pipelined design
- Pipeline registers: IF/ID, ID/EX, EX/MEM, MEM/WB
- Hazard Detection Unit (handles load-use hazards)
- Forwarding Unit (reduces data hazards)
- ALU with control logic
- Instruction Memory
- Data Memory
- Register File

---

📂 Project Structure

Pipelined-RISC-CPU-Verilog/
│
├── src/                 # All design modules
│   ├── alu.v
│   ├── alu_control.v
│   ├── control_unit.v
│   ├── data_memory.v
│   ├── forwarding_unit.v
│   ├── hazard_detection.v
│   ├── id_ex.v
│   ├── if_id.v
│   ├── imm_gen.v
│   ├── instruction_memory.v
│   ├── mem_wb.v
│   ├── pc.v
│   ├── reg_file.v
│   └── top.v
│
├── tb/                  # Testbench
│   └── tb_top.v
│
├── sim_screenshots/     # Simulation results
│   └── waveform.png
│
└── README.md

---

▶️ Simulation

The design was simulated using Xilinx Vivado (Behavioral Simulation).

📊 Simulation Output:

"Waveform" (sim_screenshots/waveform.png)

---

🛠️ Tools Used

- Verilog HDL
- Xilinx Vivado
- Behavioral Simulation

---

🧪 Key Concepts Implemented

- Instruction pipelining
- Data hazard handling
- Forwarding (bypassing)
- Pipeline stalling
- Register transfer logic
- Modular hardware design

---

📈 Learning Outcomes

- Understanding of pipelined CPU architecture
- Handling real-world hardware hazards
- Designing modular Verilog systems
- Debugging using waveform analysis

---

📌 Future Improvements

- Branch prediction
- Cache memory integration
- Performance optimization (CPI analysis)
- Support for more instructions

---

👨‍💻 Author

Subhabrata Das
B.Tech Student



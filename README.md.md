
🚀 5-Stage Pipelined RISC CPU (Verilog)

📌 Overview

This project implements a 5-stage pipelined RISC CPU using Verilog HDL in Xilinx Vivado.

Pipeline stages:

- IF (Instruction Fetch)
- ID (Instruction Decode)
- EX (Execute)
- MEM (Memory)
- WB (Write Back)

---

⚙️ Features

- 32-bit architecture
- Pipeline registers (IF/ID, ID/EX, EX/MEM, MEM/WB)
- Hazard detection unit
- Forwarding unit
- ALU with control logic
- Instruction & Data memory
- Register file

---

📁 Project Structure

src/               → Verilog design files
tb/                → Testbench
sim_screenshots/   → Simulation output

---

▶️ Simulation

- Tool: Xilinx Vivado
- Simulation: Behavioral Simulation

---

📊 Output Waveform

"Waveform" (sim_screenshots/waveform.png)

---

🧠 Learning Outcomes

- Understanding of pipelined architecture
- Hazard handling techniques
- RTL design using Verilog
- Simulation & debugging in Vivado

---

👨‍💻 Author

Subhabrata Das


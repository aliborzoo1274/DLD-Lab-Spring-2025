# DLD Lab Spring 2025

This repository contains laboratory experiments and projects for the Digital Logic Design course, Spring 2025 semester at University of Tehran. The repository includes Verilog implementations of various digital circuits and systems.

## 📚 Repository Structure

```
DLD-Lab-Spring-2025/
├── Experiment 1/           # Controller and One-Pulser Design
│   ├── DataPath/
│   ├── controller.v
│   ├── controller_onepulser.v
│   ├── onepulser_tb.v
│   ├── top_module.v
│   └── top_module_tb.v
├── Experiment 2/           # Digital Signal Processing & PWM
│   ├── DDS/
│   ├── Frequency_Divider/
│   ├── Message_process/
│   ├── pwm.v
│   ├── sine.mem
│   ├── sine.mif
│   ├── top1.v
│   ├── top1_tb.v
│   ├── top2.v
│   └── top2_tb.v
└── . gitignore
```

## 🔬 Experiments

### Experiment 1: Controller and One-Pulser
This experiment focuses on designing and implementing digital controllers with one-pulse generators: 
- **controller.v**: Main controller module implementing state machine logic
- **controller_onepulser.v**: Controller with integrated one-pulser functionality
- **top_module.v**: Top-level integration module
- **Testbenches**: `onepulser_tb.v` and `top_module_tb.v` for verification

**Key Concepts:**
- Finite State Machines (FSM)
- One-pulse generation for button debouncing
- Modular design and integration

### Experiment 2: Digital Signal Generation & PWM
This experiment implements digital signal processing components and Pulse Width Modulation:
- **pwm.v**:  Pulse Width Modulation generator
- **sine.mem / sine.mif**: Sine wave lookup tables for Direct Digital Synthesis
- **top1.v / top2.v**: Top-level modules for different configurations
- **Subdirectories**: DDS (Direct Digital Synthesis), Frequency Divider, and Message Processing modules

**Key Concepts:**
- Direct Digital Synthesis (DDS)
- Frequency division and clock management
- PWM signal generation
- Waveform generation using lookup tables

## 🛠️ Tools & Requirements

- **Language**: Verilog HDL
- **Simulation**: ModelSim, Icarus Verilog, or any Verilog simulator
- **Synthesis**: Quartus, Vivado, or compatible FPGA synthesis tools
- **Hardware**:  FPGA board (implementation dependent)

## 🚀 Getting Started

### Clone the Repository
```bash
git clone https://github.com/aliborzoo1274/DLD-Lab-Spring-2025.git
cd DLD-Lab-Spring-2025
```

### Simulate a Module
To simulate any module using a testbench:
```bash
# For Icarus Verilog
iverilog -o output.vvp module_tb.v module.v
vvp output.vvp
```

### Synthesize for FPGA
1. Open your FPGA design tool (Quartus, Vivado, etc.)
2. Create a new project
3. Add the relevant Verilog source files
4. Configure pin assignments for your target board
5. Compile and program the FPGA

## 📝 Module Description

### Experiment 1 Modules
- **One-Pulser**:  Generates a single pulse output from a continuous button press
- **Controller**:  Implements control logic for sequential operations
- **Top Module**:  Integrates controller with datapath components

### Experiment 2 Modules
- **PWM Generator**: Creates pulse-width modulated signals with adjustable duty cycle
- **DDS**: Direct Digital Synthesis for generating sinusoidal waveforms
- **Frequency Divider**:  Divides input clock to generate slower clock signals
- **Message Processor**: Handles data processing and communication protocols

## 🧪 Testing

Each major module includes a corresponding testbench (`*_tb.v`) file.  Testbenches provide:
- Input stimulus generation
- Output verification
- Timing analysis
- Waveform visualization

Run testbenches to verify module functionality before hardware implementation.

## 📖 Documentation

For detailed experiment instructions, refer to:
- Lab manual provided by the instructor
- Comments within each Verilog source file
- Course materials and lecture notes

## 🤝 Contributing

This repository is for educational purposes.  If you're a course participant:
1. Fork the repository
2. Create your feature branch
3. Commit your changes with clear messages
4. Push to your branch
5. Submit a pull request (if collaboration is enabled)

## 👤 Author

**aliborzoo1274**
- GitHub: [@aliborzoo1274](https://github.com/aliborzoo1274)
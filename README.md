# Final Report
[Final Report](https://docs.google.com/document/d/1n77MW70WNdF82Itx9e64fWp87u45cXqpo0N11W88-CU/edit?usp=sharing)
# Overview
We made a 32-bit RISC single-cycle MIPS processor, meaning all operations take the same amount of time determined by a clock cycle. Memory resides in the CPU, and is split into instruction and data memory. The instruction memory is executable and reads addresses into memory. Instructions need the PC to be incremented by 4 bits from an adder, and the data memory is where memory is written into. Controllers dictate the flow of information in the CPU, while the datapath is used to perform operations like ALU and register files. The ALU performs arithmetic, logic, and shift operations including add, sub, and, or, nor, shift right, shift left, and set less than operation. The regfile is an array of registers used to stage data temporarily. 

Although a few components do not function as intended/compile, most of our hard work on the other components made them function properly.  Please show mercy, we were both on MacOS so we had so many issues running Verilog and GTKwave.  We attended office hours and asked for help when we could from our peers and our professor. A for effort.

# The four key principles were kept in mind when designing the CPU
• Smaller is faster. 
• Simplicity favors regularity.
• Make the common case fast. 
• Good design demands good compromise.

# R-Type
Register-type instructions are used for register-based ALU operations, where the results are stored in a register file.

# I-Type
Immediate type instructions are load/store or branch operations, used when input values to ALU transfer from a register to an immediate value. 

# J-Type
Jump instructions is to jump to immediate addresses, used to load immediate values into PC. 

![Screenshot 2024-05-11 155156](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-bit_buster/assets/113416293/7a337a90-0d45-435a-9b28-44b4eb050d80)

## Compilation and Simulation
To compile then simulate:
### Linux, MacOS
```bash
make clean compile simulate
```

### Windows
```powershell
.\makefile.ps1
```

# Display of Timing Diagrams
To display simulation using GTKWAVE:

### Linux, MacOS
```bash
make display
```

### Windows
```powershell
.\display.ps1
```

Then choose your module's test bench module (`uut`), as your SST. Highlight "uut" and choose all signals, dragging them to Signal area to right. Once done, got to menu Time -> Zoom -> Zoom Bet Fit.

# Clean up the compiled and simulated files
To clean up:

### Linux, MacOS
```bash
make clean
```

### Windows
```powershell
.\clean.ps1
```

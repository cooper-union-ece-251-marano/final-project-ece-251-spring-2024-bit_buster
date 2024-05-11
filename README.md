# Final Report
[Final Report](https://docs.google.com/document/d/1n77MW70WNdF82Itx9e64fWp87u45cXqpo0N11W88-CU/edit?usp=sharing)
# Overview
We made a 32-bit RISC single-cycle MIPS processor, meaning all operations take the same amount of time determined by a clock cycle. Memory resides in the CPU, and is split into instruction and data memory. The instruction memory is executable and reads addresses into memory. Instructions need the PC to be incremented by 4 bits from an adder, and the data memory is where memory is written into. Controllers dictate the flow of information in the CPU, while the datapath is used to perform operations like ALU and register files. The ALU performs arithmetic, logic, and shift operations including add, sub, and, or, nor, shift right, shift left, and set less than operation. The regfile is an array of registers used to stage data temporarily. 

Simulating on GTKwave was an issue for us, as Lindsey and I were both on MacOS, but we debugged by displaying the results of the testbenches through the command line. As a result, we were able to get each component to compile and display correct/reasonable results, and our cpu compiled successfully as well.

![Screenshot 2024-05-11 155537](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-bit_buster/assets/113416293/dd6cb374-cdd0-4a39-ad53-d28d0ca5de99)

# The four key principles were kept in mind when designing the CPU
• Smaller is faster. <br />
• Simplicity favors regularity. <br />
• Make the common case fast. <br />
• Good design demands good compromise.<br />

# R-Type
Register-type instructions are used for register-based ALU operations, where the results are stored in a register file.

# I-Type
Immediate type instructions are load/store or branch operations, used when input values to ALU transfer from a register to an immediate value. 

# J-Type
Jump instructions is to jump to immediate addresses, used to load immediate values into PC. 

![Screenshot 2024-05-11 155326](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-bit_buster/assets/113416293/01615d33-3662-4ebc-9a87-b050f51cae60)

# Green Card
![Screenshot 2024-05-11 162540](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-bit_buster/assets/113416293/3e14d63c-3333-476c-ab2f-41f627521222)

# ISA
![Screenshot 2024-05-11 160031](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-bit_buster/assets/113416293/f161e84b-900c-4b19-ae63-083547e30225)


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

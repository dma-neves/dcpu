# 8bitCPU

**Description:**
  - A simple 8bit cpu devoloped in VHDL explicitly using logic gates and a structural description (instead of a high level behavioral description), with the exception of the memory modules and flip-flops.
  - This cpu isn't suposso to be in any way revolutionary, efficient or well optimized. I'm only trying to design the simplest possible system that has all the basic features that a cpu needs. The aim of this project is therefore, only, to learn more about cpu/computer architecture and the implementation of digital systems.

**Schematics:**
  - Main:
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/diagrams/cpu.png)

  - ALU:
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/diagrams/alu.png)

  - Control Unit:
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/diagrams/CU.png)
  
  - Seven State State Machine:
  </br>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/diagrams/seven_state_sm.png)

**Specifications:**
  - The CPU contains nine 8-bit registers: 3 general purpose registers RA RB RC, 3 instruction related registers IC (Instruction Counter) IR (Instruction Register) IDR (Instruction Data Register), a address register ADR and two accumulator registers PACR (Program Accomulator) and IACR (Instruction Counter Accomulator).
  - The 8bit [ALU](https://github.com/dma-neves/VHDL_ALU) can perform 8 different operations and its flags can be stored in the 3 bit flag register FLAGR.
  - The Control Unit cointains a 7 state SM (state 0 fetches the instruction | state 1 increments the IC | state 2 transfers IACR to IC | state 4 fetches the instruction data | state 4 decodes and executes | state 5 and 6 do the same as 1 and 2) therefore the cpu executes 1 instruction every 7 clock cycles. The instruction decoder and operation decoder activate the correct [operations](https://github.com/dma-neves/8bitCPU/blob/main/other/instruction_outputs/instructionOutputs.txt) for each instruction.
  
**ISA:**

	Logic & Arithmetic:

	add RX RY
	sub RX RY
	ssp $V (subtract V from the stack pointer)
	inc RX
	dec RX
	neg RX
	not RX
	and RX RY
	or  RX RY

	Memory:

	lod $V ADR
	str $V [ADR]
	lod [ADR] RX
	str RX [ADR]
	lod RX ADR
	lod ACR RX
	lod ACR ADR
	str ACR [ADR]
	str IC [ADR]

	Instruction change:

	jmp  ADR
	jmp  X
	jmpz X
	jmpn X
	jmpo X
	hlt



**Programming the ROM**
  - To facilitate the programming of the ROM I created a simple assembler and ROM generator (https://github.com/dma-neves/Assembler). An example follows:
  - I wrote an assembly program that calculates n factorial. In this example n=5 therefore the final result stored in register A will be 5! = 120 = 0b01111000
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/example/factorialProgram.png)
  - Given the assembly code we can generate the binary using the assembler and the ROM256.vhd using the romGenerator
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/example/factorialBinary.png)
  - Finally, putting the ROM file in the Xilinx project we can simulate the cpu and check the final result stored in rega (register A).
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/example/factorialSimultedResult.png)

# 8bitCPU

**Description:**
  - A simple 8bit cpu devoloped in VHDL explicitly using logic gates and a structural description (instead of a high level behavioral description), with the exception of the memory modules and flip-flops.
  - This cpu isn't suposso to be in any way revolutionary, efficient or well optimized. I'm only trying to design the simplest possible system that has all the basic features that a cpu needs. The aim of this project is therefore, only, to learn more about cpu/computer architecture and about the implementation of digital systems.

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
  - The CPU contains 15 registers: eight 8-bit general purpose registers RA - RH (The register RH is meant to be used as the Stack Pointer); three instruction related registers IC (Instruction Counter) IR (Instruction Register) and IDR (Instruction Data Register); an address register ADR; two accumulator registers PACR (Program Accumulator) and IACR (Instruction Counter Accumulator); and a ALU flag register FLAGR
  - The 8bit ALU can perform 8 different operations:
	- opc 000: add (A + B)
	- opc 001: sub (A - B)
	- opc 010: inc (A+1)
	- opc 011: dec (A-1)
	- opc 100: neg (-A)
	- opc 101: not (~A)
	- opc 110: and (A ^ B)
	- opc 111: or  (A v B)
  - The Control Unit cointains a 7 state SM (state 0 fetches the instruction; state 1 increments the IC; state 2 loads IACR to IC; state 4 fetches the instruction data ; state 4 decodes and executes ; state 5 and 6 do the same as 1 and 2 respectively). Therefore the cpu executes 1 instruction every 7 clock cycles. The instruction decoder and operation decoder activate the correct [operations](https://github.com/dma-neves/8bitCPU/blob/main/other/instruction_outputs/instructionOutputs.txt) for each instruction.
  - A program to be executed by the CPU, must be loaded into the 256 byte ROM module that can be generated using the [assembler and rom generator](https://github.com/dma-neves/8bcpuAssembler).
  - The CPU has access to a 64 byte RAM module. The stack starts at address 0x0 and grows upwards. Address 0x3F (63) is reserved for IO and address 0x3E (62) is reserved as a temporary memory slot used by some assmebly macros. 
  
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



**Simulated Example Using ghdl**
  - I wrote an assembly program (using some of the assembler's macros) with a `main` function and a `int avg(int* arr, int len)` function to calculate the average of a given array `arr` of length `len`. In this example the array was `arr = [5, 2, 9]` with `len = 3`. Therefore, the final result stored in register A sould be (5+2+9)/3 = 5. 
    <br/>![alt text](https://github.com/dma-neves/8bcpu/blob/main/other/example/averageProgram.png)
  - Given the assembly code we can generate the binary using the assembler. With the binary we can also generate the ROM module using the rom generator.
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/example/averageBinary.png)
  - Finally, using ghdl, we can simulate the CPU, with the program loaded in ROM, and check the final result stored in register A which is 5.
  <br/>![alt text](https://github.com/dma-neves/8bitCPU/blob/main/other/example/averageResult.png)

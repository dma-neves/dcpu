# VHDL_8bitCPU

**Description:**
  - A simple 8bit cpu that will be devoloped in VHDL implicitly using logic gates and a structural (instead of high level behavioral) description (exception for the DFlipFlop implementation because of latching issues). Devoleped using the Xilinx ISE tool.
  - This cpu isn't suposso to be in any way revolutionary, efficient or well optimized, i'm only trying to design the simplest possible system that has all the basic features that a cpu needs. The aim of this project is therefore only to learn more about cpu/computer architecture and digital systems implementation.

**Schematics:**\
  - Main:
  ![alt text](https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/cpu.png)

  - Control Unit:
  ![alt text](https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/CU.png)
  
  - Seven State State Machine:
  ![alt text](https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/seven_state_sm.png)

**Specifications:**
  - The CPU will contain 3 general purpose registers RA RB RC, 3 instruction related registers IC (Instruction Counter) IR (Instruction Register) IDR (Instruction Data Register) and a accumulator register ACR.
  - The 8bit ALU can perform 8 different operations. More detailed description: https://github.com/dma-neves/VHDL_ALU.
  - The Control Unit cointains a 7 state SM (state 0 fetches the instruction | state 1 increments the IC | state 2 transfers ACR to IC | state 3 decodes and executes | state 4 and 5 do the same as 1 and 2) therefore the cpu executes 1 instruction every 7 clock cycles. It also contains a instruction decoder that basically works as a demultiplexer and a operation decoder that activates the correct operations for each instruction (https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/instructionOutputs.txt).
  
**ISA:**

	Arithmetic:

	00 add RA RB
    01 add RA RC
	02 add RA X
	03 sub RA RB
    04 sub RA RC
	05 sub RA X
	06 inc RA
	07 dec RA
	08 neg RA
	09 not RA
	10 and RA RB
    11 and RA RC
	12 or  RA RB
    13 or  RA RC

	Memory:

	14 lod addr RA
	15 str RA   addr
	16 lod addr RB
	17 str RB   addr
	18 lod addr RC
	19 str RC   addr
	20 lod ACR  RA
	21 str ACR  addr

	Instruction change:

	22 jmp  X
	23 jmpz X
	24 jmpn X
	25 jmpo X
	26 hlt

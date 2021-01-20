# VHDL_8bitCPU

**Description:**
  - A simple 8bit cpu that will be devoloped in VHDL implicitly using logic gates and a structural (instead of high level behavioral) description (exception for the DFlipFlop implementation because of latching issues). Devoleped using the Xilinx ISE tool.
  - This cpu isn't suposso to be in any way revolutionary, efficient or well optimized, i'm only trying to design the simplest possible system that has all the basic features that a cpu needs. The aim of this project ist there fore only to learn more about cpu/computer architecture and digital systems implementation.

**Schematics:**\
  Main:
  ![alt text](https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/cpu_schem.png)

  Control Unit:
  ![alt text](https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/CU.png)
  
  Seven State State Machine:
  ![alt text](https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/seven_state_sm.png)

**Specifications:**
  - The CPU will contain 3 general purpose registers RA RB RC, 3 instruction related registers IC (Instruction Counter) IR (Instruction Register) IDR (Instruction Data Register) and a accumulator register ACR.
  - The 8bit ALU can perform 8 different operations. More detailed description: https://github.com/dma-neves/VHDL_ALU.
  
**ISA (temporary):**

	Arithmetic:

	00 add RA RB
	01 add RA X
	02 sub RA RB
	03 sub RA X
	04 inc RA
	05 dec RA
	06 neg RA
	07 not RA
	08 and RA RB
	09 or  RA RB

	Memory:

	10 lod addr RA
	11 str RA   addr
	12 lod addr RB
	13 str RB   addr
	14 lod addr RC
	15 str RC   addr
	16 lod ACR  RA
	17 str ACR  addr

	Instruction change:

	18 jmp  X
	19 jmpz X
	20 jmpn X
	21 jmpO X
	22 hlt

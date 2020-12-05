# VHDL_8bitCPU

**Description:**
  - A simple 8bit cpu that will be devoloped in VHDL implicitly using logic gates and a structural (instead of high level behavioral) description. Devoleped using the Xilinx ISE tool.
  - This cpu isn't suposso to be in any way revolutionary, efficient or well optimized, i'm only trying to design the simplest possible system that has all the basic features that a cpu needs. The aim of this project ist there fore only to learn more about cpu/computer architecture and digital systems implementation.

**Schematic:**
  ![alt text](https://github.com/dma-neves/VHDL_8bitCPU/blob/main/other/cpu_schem.png)

**Specifications:**
  - The CPU will contain 3 general purpose registers RA RB RC, 3 instruction related registers IC (Instruction Counter) IR (Instruction Register) IDR (Instruction Data Register) and a accumulator register ACR.
  - The 8bit ALU can perform 8 different operations. More detailed description: (https://github.com/dma-neves/VHDL_ALU).
  
**ISA (temporary):**

	Arithmetic:

	00 add RA RB
	01 sub RA RB
	02 inc RA
	03 dec RA
	04 neg RA
	05 not RA
	06 and RA RB
	07 or  RA RB

	Memory:

	08 lod addr RA
	09 lod IDR  RA
	09 str RA   addr
	10 lod addr RB
	11 lod IDR  RB
	12 str RB   addr
	13 lod addr RC
	14 lod IDR  RC
	15 str RC   addr
	16 lod ACR  RA
	17 str ACR  addr

	Instruction change:

	18 jmp  addr
	19 jmpz addr
	20 jmpn addr
	21 jmp0 addr
	22 hlt

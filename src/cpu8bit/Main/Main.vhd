
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Main is
Port(
	clk : in STD_LOGIC;
	reset, start, run, step : in STD_LOGIC;
	
	regA, regB, regC, regIC, regIR, regIDR, regIACR, regPACR, regADR : out STD_LOGIC_VECTOR(7 downto 0)
);
end Main;

architecture Behavioral of Main is

-- Components

component CPU is
Port(
	reset, start : in STD_LOGIC;
	clk : in STD_LOGIC;
	dataIn : in STD_LOGIC_VECTOR(7 downto 0);
	
	address : out STD_LOGIC_VECTOR(7 downto 0);
	dataOut : out STD_LOGIC_VECTOR(7 downto 0);
	readWrite : out STD_LOGIC;
	fetch : out STD_LOGIC; 
	
	regA, regB, regC, regIC, regIR, regIDR, regIACR, regPACR, regADR : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component ClockManager is
Port(
	clk : in STD_LOGIC;
	run, step : in STD_LOGIC;
	
	clk_out : out STD_LOGIC
);
end component;

component RAM32 is
Port(
	adr : in STD_LOGIC_VECTOR(4 downto 0);
	En : in STD_LOGIC;
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC_VECTOR(7 downto 0);
	DO : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component ROM256 is
Port(
	adr : in STD_LOGIC_VECTOR(7 downto 0);
	En : in STD_LOGIC;
	DO : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

-- Signals
signal clk_aux : STD_LOGIC;
signal adr_aux, ramData, romData, dataToCPU, dataToMem : STD_LOGIC_VECTOR(7 downto 0);
signal adr_mem : STD_LOGIC_VECTOR(4 downto 0);
signal RW_aux : STD_LOGIC;

signal fetch, ramEn, romEn : STD_LOGIC; 

begin

romEn <= fetch;
ramEn <= (not fetch);

dataToCPU(0) <= ramData(0) or romData(0);
dataToCPU(1) <= ramData(1) or romData(1);
dataToCPU(2) <= ramData(2) or romData(2);
dataToCPU(3) <= ramData(3) or romData(3);
dataToCPU(4) <= ramData(4) or romData(4);
dataToCPU(5) <= ramData(5) or romData(5);
dataToCPU(6) <= ramData(6) or romData(6);
dataToCPU(7) <= ramData(7) or romData(7);

adr_mem(0) <= adr_aux(0);
adr_mem(1) <= adr_aux(1);
adr_mem(2) <= adr_aux(2);
adr_mem(3) <= adr_aux(3);
adr_mem(4) <= adr_aux(4);

-- Port maps

CLKM: ClockManager port map(clk, run, step, clk_aux);

CPU_M: CPU port map(reset, start, clk_aux, dataToCPU, adr_aux, dataToMem, 
						  RW_aux, fetch, regA, regB, regC, regIC, regIR, regIDR,
						  regIACR, regPACR, regADR);
RAM32_M: RAM32 port map(adr_mem, ramEn, reset, RW_aux, dataToMem, ramData);
ROM256_M: ROM256 port map(adr_aux, romEn, romData);

end Behavioral;


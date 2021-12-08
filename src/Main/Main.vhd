
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Main is
Port(
	clk : in STD_LOGIC;
	reset, run, step : in STD_LOGIC;
	regSel : in STD_LOGIC_VECTOR(3 downto 0);

	reg, regIR, regIC : out STD_LOGIC_VECTOR(7 downto 0);
	state_0, state_1, state_2, state_3, state_4, state_5, state_6 : out STD_LOGIC
);
end Main;

architecture Behavioral of Main is

-- Components

component CPU is
Port(
	reset : in STD_LOGIC;
	clk : in STD_LOGIC;
	dataIn : in STD_LOGIC_VECTOR(15 downto 0);

	regSel : in STD_LOGIC_VECTOR(3 downto 0);
	
	address : out STD_LOGIC_VECTOR(15 downto 0);
	dataOut : out STD_LOGIC_VECTOR(15 downto 0);
	readWrite : out STD_LOGIC;
	fetch : out STD_LOGIC; 

	reg, regIR, regIC : out STD_LOGIC_VECTOR(15 downto 0);
	state_0, state_1, state_2, state_3, state_4, state_5, state_6 : out STD_LOGIC
);
end component;

component ClockManager is
Port(
	clk : in STD_LOGIC;
	run, step : in STD_LOGIC;
	
	clk_out : out STD_LOGIC
);
end component;

component RAM64 is
Port(
	adr : in STD_LOGIC_VECTOR(5 downto 0);
	En : in STD_LOGIC;
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC_VECTOR(15 downto 0);
	DO : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component ROM is
Port(
	adr : in STD_LOGIC_VECTOR(15 downto 0);
	En : in STD_LOGIC;
	DO : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

-- Signals
signal clk_aux : STD_LOGIC;
signal adr, ramData, romData, dataToCPU, dataToMem : STD_LOGIC_VECTOR(15 downto 0);
signal adr_mem : STD_LOGIC_VECTOR(5 downto 0);
signal rw : STD_LOGIC;

signal fetch, ramEn, romEn : STD_LOGIC; 

signal reg_16, regIR_16, regIC_16 : STD_LOGIC_VECTOR(15 downto 0);

begin

reg(7 downto 0) <= reg_16(7 downto 0);
regIR(7 downto 0) <= regIR_16(7 downto 0);
regIC(7 downto 0) <= regIC_16(7 downto 0);

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
dataToCPU(8) <= ramData(8) or romData(8);
dataToCPU(9) <= ramData(9) or romData(9);
dataToCPU(10) <= ramData(10) or romData(10);
dataToCPU(11) <= ramData(11) or romData(11);
dataToCPU(12) <= ramData(12) or romData(12);
dataToCPU(13) <= ramData(13) or romData(13);
dataToCPU(14) <= ramData(14) or romData(14);
dataToCPU(15) <= ramData(15) or romData(15);

adr_mem(0) <= adr(0);
adr_mem(1) <= adr(1);
adr_mem(2) <= adr(2);
adr_mem(3) <= adr(3);
adr_mem(4) <= adr(4);
adr_mem(5) <= adr(5);

-- Port maps

CLKM: ClockManager port map(clk, run, step, clk_aux);

CPU_M: CPU port map(

	reset, clk_aux, dataToCPU, regSel, adr, dataToMem, 
	rw, fetch, 
    reg_16, regIR_16, regIC_16,
	state_0, state_1, state_2, state_3, state_4, state_5, state_6
);

RAM64_M: RAM64 port map(adr_mem, ramEn, reset, rw, dataToMem, ramData);
ROM_M: ROM port map(adr, romEn, romData);

end Behavioral;


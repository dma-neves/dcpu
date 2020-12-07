library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mem256b is

Port(
	adr : in STD_LOGIC_VECTOR(7 downto 0);
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC;
	DO : out STD_LOGIC
);

end Mem256b;

architecture Behavioral of Mem256b is

component MemRow16b
Port(
	adr : in STD_LOGIC_VECTOR(3 downto 0);
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC;
	DO : out STD_LOGIC
);
end component;

component DeMux16_1b
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	
	I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : out STD_LOGIC
);
end component;

signal I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : STD_LOGIC;
signal l_adr, h_adr : STD_LOGIC_VECTOR(3 downto 0);

signal MR00RW, MR00DO, MR00EDO : STD_LOGIC;
signal MR01RW, MR01DO, MR01EDO : STD_LOGIC;
signal MR02RW, MR02DO, MR02EDO : STD_LOGIC;
signal MR03RW, MR03DO, MR03EDO : STD_LOGIC;
signal MR04RW, MR04DO, MR04EDO : STD_LOGIC;
signal MR05RW, MR05DO, MR05EDO : STD_LOGIC;
signal MR06RW, MR06DO, MR06EDO : STD_LOGIC;
signal MR07RW, MR07DO, MR07EDO : STD_LOGIC;
signal MR08RW, MR08DO, MR08EDO : STD_LOGIC;
signal MR09RW, MR09DO, MR09EDO : STD_LOGIC;
signal MR10RW, MR10DO, MR10EDO : STD_LOGIC;
signal MR11RW, MR11DO, MR11EDO : STD_LOGIC;
signal MR12RW, MR12DO, MR12EDO : STD_LOGIC;
signal MR13RW, MR13DO, MR13EDO : STD_LOGIC;
signal MR14RW, MR14DO, MR14EDO : STD_LOGIC;
signal MR15RW, MR15DO, MR15EDO : STD_LOGIC;

begin

l_adr(0) <= adr(0);
l_adr(1) <= adr(1);
l_adr(2) <= adr(2);
l_adr(3) <= adr(3);

h_adr(0) <= adr(4);
h_adr(1) <= adr(5);
h_adr(2) <= adr(6);
h_adr(3) <= adr(7);

MR00RW <= I0 and rw;
MR00: MemRow16b port map (l_adr, R, MR00RW, DI, MR00DO);
MR00EDO <= MR00DO and I0;

MR01RW <= I1 and rw;
MR01: MemRow16b port map (l_adr, R, MR01RW, DI, MR01DO);
MR01EDO <= MR01DO and I1;

MR02RW <= I2 and rw;
MR02: MemRow16b port map (l_adr, R, MR02RW, DI, MR02DO);
MR02EDO <= MR02DO and I2;

MR03RW <= I3 and rw;
MR03: MemRow16b port map (l_adr, R, MR03RW, DI, MR03DO);
MR03EDO <= MR03DO and I3;

MR04RW <= I4 and rw;
MR04: MemRow16b port map (l_adr, R, MR04RW, DI, MR04DO);
MR04EDO <= MR04DO and I4;

MR05RW <= I5 and rw;
MR05: MemRow16b port map (l_adr, R, MR05RW, DI, MR05DO);
MR05EDO <= MR05DO and I5;

MR06RW <= I6 and rw;
MR06: MemRow16b port map (l_adr, R, MR06RW, DI, MR06DO);
MR06EDO <= MR06DO and I6;

MR07RW <= I7 and rw;
MR07: MemRow16b port map (l_adr, R, MR07RW, DI, MR07DO);
MR07EDO <= MR07DO and I7;

MR08RW <= I8 and rw;
MR08: MemRow16b port map (l_adr, R, MR08RW, DI, MR08DO);
MR08EDO <= MR08DO and I8;

MR09RW <= I9 and rw;
MR09: MemRow16b port map (l_adr, R, MR09RW, DI, MR09DO);
MR09EDO <= MR09DO and I9;

MR10RW <= I10 and rw;
MR10: MemRow16b port map (l_adr, R, MR10RW, DI, MR10DO);
MR10EDO <= MR10DO and I10;

MR11RW <= I11 and rw;
MR11: MemRow16b port map (l_adr, R, MR11RW, DI, MR11DO);
MR11EDO <= MR11DO and I11;

MR12RW <= I12 and rw;
MR12: MemRow16b port map (l_adr, R, MR12RW, DI, MR12DO);
MR12EDO <= MR12DO and I12;

MR13RW <= I13 and rw;
MR13: MemRow16b port map (l_adr, R, MR13RW, DI, MR13DO);
MR13EDO <= MR13DO and I13;

MR14RW <= I14 and rw;
MR14: MemRow16b port map (l_adr, R, MR14RW, DI, MR14DO);
MR14EDO <= MR14DO and I14;

MR15RW <= I15 and rw;
MR15: MemRow16b port map (l_adr, R, MR15RW, DI, MR15DO);
MR15EDO <= MR15DO and I15;


DO <=
MR00EDO or MR01EDO or MR02EDO or MR03EDO or
MR04EDO or MR05EDO or MR06EDO or MR07EDO or
MR08EDO or MR09EDO or MR10EDO or MR11EDO or
MR12EDO or MR13EDO or MR14EDO or MR15EDO;

end Behavioral;


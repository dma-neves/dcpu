library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mem32b is

Port(
	adr : in STD_LOGIC_VECTOR(4 downto 0);
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC;
	DO : out STD_LOGIC
);

end Mem32b;

architecture Behavioral of Mem32b is

component MemRow16b
Port(
	adr : in STD_LOGIC_VECTOR(3 downto 0);
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC;
	DO : out STD_LOGIC
);
end component;

signal l_adr : STD_LOGIC_VECTOR(3 downto 0);

signal MR00RW, MR00DO, MR00EDO : STD_LOGIC;
signal MR01RW, MR01DO, MR01EDO : STD_LOGIC;

begin

l_adr(0) <= adr(0);
l_adr(1) <= adr(1);
l_adr(2) <= adr(2);
l_adr(3) <= adr(3);

MR00RW <= (not adr(4)) and rw;
MR00: MemRow16b port map (l_adr, R, MR00RW, DI, MR00DO);
MR00EDO <= MR00DO and (not adr(4));

MR01RW <= adr(4) and rw;
MR01: MemRow16b port map (l_adr, R, MR01RW, DI, MR01DO);
MR01EDO <= MR01DO and adr(4);

DO <= MR00EDO or MR01EDO;

end Behavioral;


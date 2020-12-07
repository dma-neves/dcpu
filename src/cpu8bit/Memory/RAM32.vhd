
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM32 is
Port(
	clk : in STD_LOGIC;
	adr : in STD_LOGIC_VECTOR(4 downto 0);
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC_VECTOR(7 downto 0);
	DO : out STD_LOGIC_VECTOR(7 downto 0)
);
end RAM32;

architecture Behavioral of RAM32 is

component Mem32b
Port(
	adr : in STD_LOGIC_VECTOR(4 downto 0);
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC;
	DO : out STD_LOGIC
);
end component;

signal ERW : STD_LOGIC;

begin

ERW <= rw and (not clk);

MEM32_0: Mem32b port map (adr, R, ERW, DI(0), DO(0));
MEM32_1: Mem32b port map (adr, R, ERW, DI(1), DO(1));
MEM32_2: Mem32b port map (adr, R, ERW, DI(2), DO(2));
MEM32_3: Mem32b port map (adr, R, ERW, DI(3), DO(3));
MEM32_4: Mem32b port map (adr, R, ERW, DI(4), DO(4));
MEM32_5: Mem32b port map (adr, R, ERW, DI(5), DO(5));
MEM32_6: Mem32b port map (adr, R, ERW, DI(6), DO(6));
MEM32_7: Mem32b port map (adr, R, ERW, DI(7), DO(7));

end Behavioral;


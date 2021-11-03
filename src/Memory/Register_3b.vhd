library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_3b is

Port(
	En, R : in STD_LOGIC;
	DIn : in STD_LOGIC_VECTOR(2 downto 0);
	DOut : out STD_LOGIC_VECTOR(2 downto 0)
);

end Register_3b;

architecture Behavioral of Register_3b is

component DFlipFlop
Port(
	D, En, R : in STD_LOGIC;
	Q : OUT STD_LOGIC
);
end component;

begin

	DFF_0: DFlipFlop port map (DIn(0), En, R, DOut(0));
	DFF_1: DFlipFlop port map (DIn(1), En, R, DOut(1));
	DFF_2: DFlipFlop port map (DIn(2), En, R, DOut(2));

end Behavioral;


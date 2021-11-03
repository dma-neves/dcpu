library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_16b is

Port(
	En, R : in STD_LOGIC;
	DIn : in STD_LOGIC_VECTOR(15 downto 0);
	DOut : out STD_LOGIC_VECTOR(15 downto 0)
);

end Register_16b;

architecture Behavioral of Register_16b is

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
	DFF_3: DFlipFlop port map (DIn(3), En, R, DOut(3));
	DFF_4: DFlipFlop port map (DIn(4), En, R, DOut(4));
	DFF_5: DFlipFlop port map (DIn(5), En, R, DOut(5));
	DFF_6: DFlipFlop port map (DIn(6), En, R, DOut(6));
	DFF_7: DFlipFlop port map (DIn(7), En, R, DOut(7));
	DFF_8: DFlipFlop port map (DIn(8), En, R, DOut(8));
	DFF_9: DFlipFlop port map (DIn(9), En, R, DOut(9));
	DFF_10: DFlipFlop port map (DIn(10), En, R, DOut(10));
	DFF_11: DFlipFlop port map (DIn(11), En, R, DOut(11));
	DFF_12: DFlipFlop port map (DIn(12), En, R, DOut(12));
	DFF_13: DFlipFlop port map (DIn(13), En, R, DOut(13));
	DFF_14: DFlipFlop port map (DIn(14), En, R, DOut(14));
	DFF_15: DFlipFlop port map (DIn(15), En, R, DOut(15));

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16 is
Port(
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	I0, I1, I2, I3,
	I4, I5, I6, I7,
	I8, I9, I10, I11,
	I12, I13, I14, I15
	: in STD_LOGIC_VECTOR(7 downto 0);
	
	d : out STD_LOGIC_VECTOR(7 downto 0)
);
end Mux16;

architecture Behavioral of Mux16 is

component Mux4
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	o : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

signal l_sel, h_sel : STD_LOGIC_VECTOR(1 downto 0);
signal M0_d, M1_d, M2_d, M3_d : STD_LOGIC;

begin

LMUX0: Mux4 port map(l_sel, I0, I1, I2, I3, M0_d);
LMUX1: Mux4 port map(l_sel, I4, I5, I6, I7, M1_d);
LMUX2: Mux4 port map(l_sel, I8, I9, I10, I11, M2_d);
LMUX3: Mux4 port map(l_sel, I12, I13, I14, I15, M3_d);

HMUX: Mux4 port map(h_sel, M0_d, M1_d, M2_d, M3_d, d);

end Behavioral;


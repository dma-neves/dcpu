library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16 is
Port(
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	I0, I1, I2, I3,
	I4, I5, I6, I7,
	I8, I9, I10, I11,
	I12, I13, I14, I15
	: in STD_LOGIC_VECTOR(15 downto 0);
	
	d : out STD_LOGIC_VECTOR(15 downto 0)
);
end Mux16;

architecture Behavioral of Mux16 is

component Mux4
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal l_sel, h_sel : STD_LOGIC_VECTOR(1 downto 0);
signal M0_d, M1_d, M2_d, M3_d : STD_LOGIC_VECTOR(15 downto 0);

begin

l_sel(0) <= sel(0);
l_sel(1) <= sel(1);

h_sel(0) <= sel(2);
h_sel(1) <= sel(3);

LMUX0: Mux4 port map(I0, I1, I2, I3, l_sel, M0_d);
LMUX1: Mux4 port map(I4, I5, I6, I7, l_sel, M1_d);
LMUX2: Mux4 port map(I8, I9, I10, I11, l_sel, M2_d);
LMUX3: Mux4 port map(I12, I13, I14, I15, l_sel, M3_d);

HMUX: Mux4 port map(M0_d, M1_d, M2_d, M3_d, h_sel, d);

end Behavioral;


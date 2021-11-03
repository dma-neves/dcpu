library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux32 is
Port(
	sel : in STD_LOGIC_VECTOR(4 downto 0);
	
	I0, I1, I2, I3,
	I4, I5, I6, I7,
	I8, I9, I10, I11,
	I12, I13, I14, I15,
	I16, I17, I18, I19,
	I20, I21, I22, I23,
	I24, I25, I26, I27,
	I28, I29, I30, I31 :
	in STD_LOGIC_VECTOR(15 downto 0);
	
	d : out STD_LOGIC_VECTOR(15 downto 0)
);
end Mux32;

architecture Behavioral of Mux32 is

component Mux16
Port(
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	I0, I1, I2, I3,
	I4, I5, I6, I7,
	I8, I9, I10, I11,
	I12, I13, I14, I15
	: in STD_LOGIC_VECTOR(15 downto 0);
	
	d : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component Mux2
Port(
	I0, I1 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal l_sel : STD_LOGIC_VECTOR(3 downto 0);
signal M0_d, M1_d : STD_LOGIC_VECTOR(15 downto 0);

begin

l_sel(0) <= sel(0);
l_sel(1) <= sel(1);
l_sel(2) <= sel(2);
l_sel(3) <= sel(3);

M16_0: Mux16 port map (l_sel, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, M0_d);
M16_1: Mux16 port map (l_sel, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, M1_d);

M2: Mux2 port map (M0_d, M1_d, sel(4), d);

end Behavioral;

